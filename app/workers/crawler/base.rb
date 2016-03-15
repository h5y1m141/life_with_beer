require 'rest-client'
require 'nokogiri'

class Crawler::Base < ApplicationController
  def initialize
    log_file = (Rails.env == "production") ? 'production.log' : 'crawler.log'
    @logger = Logger.new("log/#{log_file}")
    @sleep_time = 2
    @redis = Redis.new
  end

  def insert_queue(pages, site_name)
    pages.each {|page| @redis.rpush(site_name ,page.to_json)}
  end

  def run
  end
end
