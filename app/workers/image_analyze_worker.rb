class ImageAnalyzeWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  sidekiq_options queue: :life_with_beer, retry: 1
  # recurrence { daily.hour_of_day(3, 6, 9, 12, 15, 18, 21) }
  recurrence { hourly }

  def initialize
    @cap_analyze    = ImageAnalyze::Cap.new
    @goout    = Crawler::Goout.new
    @zozotown = Crawler::Zozotown.new
    puts 'CoreWorker init done'
  end
  def perform
    @nanga.run
    @goout.run
    # @zozotown.run
  end
end
