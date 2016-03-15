class ScrapingWorker
  include Crawler::Searchable
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  sidekiq_options queue: :life_with_beer, retry: 1
  recurrence { hourly.minute_of_hour(10, 20, 30, 40, 50) }

  def initialize
    @scraper = Crawler::Scraper.new
  end
  def perform
    @scraper.run
    puts 'scraper perform done'
    # refer
    # http://h3poteto.hatenablog.com/entry/2015/03/31/013717
    ActiveRecord::Base.connection.close
  end
end
