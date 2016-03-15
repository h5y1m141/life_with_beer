ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
require 'database_cleaner'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
RSpec.configure do |config|
  config.order = :random
  Kernel.srand config.seed

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!
  config.render_views = true

  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.before(:all) do
    DatabaseCleaner.start
  end

  config.after(:all) do
    DatabaseCleaner.clean
  end
  # 以下設定しないとfactoryの変更が反映されません
  config.before(:all) do
    FactoryGirl.reload
  end
end
