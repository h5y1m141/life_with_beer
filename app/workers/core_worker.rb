class CoreWorker
  include Crawler::Searchable
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  sidekiq_options queue: :life_with_beer, retry: 1
  # recurrence { daily.hour_of_day(3, 6, 9, 12, 15, 18, 21) }
  recurrence { hourly }

  def initialize
    @goout    = Crawler::Goout.new
    puts 'CoreWorker init done'
  end
  def perform
    @goout.run
  end
end
