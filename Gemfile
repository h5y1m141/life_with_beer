ruby '2.4.0'
source 'https://rubygems.org'

gem 'rails', '4.2.0'

# Middleware
gem 'unicorn'
gem 'mysql2', '~> 0.3.20'
gem 'ransack'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'

# Scraping
gem 'rest-client'
gem 'nokogiri'

# View
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'angularjs-rails'
gem 'jbuilder', '~> 2.0'
gem 'kaminari'
gem 'twitter-bootstrap-rails'

## scheduler
gem 'sidekiq', '3.4.2'
gem 'sinatra', require: false # sidekiqのダッシュボード機能利用するため導入
gem 'sidetiq'
gem 'celluloid', '0.16.0'
gem 'ice_cube'

# Mountable Engine
gem 'blog_engine', path: 'blog_engine'

# other
gem 'settingslogic'
gem 'rmagick'
gem 'carrierwave'
gem 'seed-fu', '~> 2.3'
gem 'devise', '~> 3.5'
gem 'sitemap_generator'
gem 'jp_prefecture'
gem 'sprockets-rails', '~> 2.0' # https://github.com/modeset/teaspoon/issues/443
gem 'pr_geohash'

# SEO
gem 'meta-tags', require: 'meta_tags'
gem 'sitemap_generator'

group :development do
  gem 'annotate'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano3-unicorn'
  gem 'thin'
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  gem 'better_errors'
  gem 'awesome_print'
  gem 'pry-rails'
  gem 'byebug'
  gem 'spring'
  gem 'factory_girl_rails'
  gem 'rack-cors', :require => 'rack/cors'
  gem 'teaspoon-jasmine'
end

group :test do
  gem 'rspec'
  gem 'rspec-rails'
  # gem 'capybara'
  # gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'fakeredis', require: 'fakeredis/rspec'
  gem 'shoulda-matchers', require: false
  gem 'shoulda-callback-matchers', '~> 1.1.1'
end
