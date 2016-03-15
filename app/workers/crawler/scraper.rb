class Crawler::Scraper
  include Crawler::Searchable

  def initialize
    @redis = Redis.new
    @zozotown = Crawler::Zozotown.new
    @goout = Crawler::Goout.new
    @nanga = Crawler::Nanga.new
    @sleep_time = 2
    @sites = [
      # { name: 'zozotown', crawl: @zozotown },
      { name: 'goout', crawl: @goout },
      { name: 'nanga', crawl: @nanga }
    ]
  end
  def run
    @sites.each do |site|
      queues = @redis.lrange(site[:name],0 ,-1)
      if queues.count > 0
        queues.each do |queue|
          json = JSON.parse(queue)
          params = site[:crawl].page_data(json['url'])
          Item.create_or_update_by_crawler(params) unless params[:name].empty? && params[:images].empty?
          @redis.lpop(site[:name])
          sleep(@sleep_time)
        end
      end      
    end
  end
end
