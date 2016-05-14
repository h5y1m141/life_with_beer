require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)
module LifeWithBeer
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('lib')
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
    config.i18n.fallbacks = { ja: :en }
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}', 'uploaders').to_s]

    config.active_record.raise_in_transactional_callbacks = true
    config.generators do |g|
      g.test_framework :rspec, view_specs: false, helper_specs: false, fixture: true
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    config.action_controller.page_cache_directory = "#{Rails.root.to_s}/public/archives"
  end
end
