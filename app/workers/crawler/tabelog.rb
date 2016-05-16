class Crawler::Tabelog < Crawler::Base
  include Crawler::Searchable

  def initialize
    super
    @base_url = 'http://tabelog.com'
    @site_name = 'tabelog'
    @redis = Redis.new
  end
  def run
    fetch_places
    search_at_tabelog
  end

  def fetch_places
    pages = []
    tokyo_places = Place.where(prefecture_id: 13, place_type: 0)
    tokyo_places.each do |place|
      place_english_name = place.prefecture.name_e.downcase
      place_japanese_name = URI.encode(place.address.match(/.*[区|市]/).to_s)
      place_name = URI.encode(place.name)
      tabelog_detail_page_url = "#{@base_url}/#{place_english_name}/rstLst/?vs=1&sa=#{place_japanese_name}&sk=#{place_name}&sw=#{place_name}"
      pages.push({ place_id: place.id, url: tabelog_detail_page_url, name: place.name }) if tabelog_detail_page_url
    end
    insert_queue(pages, @site_name)
  end
  
  def search_at_tabelog    
    @redis.lrange(@site_name,0 ,-1).each do |queue|
      json = JSON.parse(queue)
      url = json['url']
      page = Nokogiri::HTML.parse(page_source(url))
      persist(page, url) if page
      sleep 3
    end
  end

  private

  def persist(page, url)
    @redis.set(url, Marshal.dump(page.to_s))
    @redis.lpop(@site_name)    
  end
end
