require 'rexml/document'
class Crawler::Geocoding < Crawler::Base
  include Crawler::Searchable
  
  def initialize
    super
    @file_path = "#{Rails.root}/app/workers/crawler/"
    @places = JSON.parse(File.read(@file_path + 'my_basket.json'))
  end

  def run
    @places.each.with_index(1) do |place, index|
      url = "http://www.geocoding.jp/api/?v=1.1&q=#{place['address']}"
      doc = REXML::Document.new(page_source(URI.escape(url)))
      if doc
        latitude  = doc.elements['result/coordinate/lat'].text
        longitude = doc.elements['result/coordinate/lng'].text          
        data = {
          name: place['name'],
          prefecture_id: place['prefecture_id'],
          address: place['address'],
          address2: place['address2'],
          latitude: latitude,
          longitude: longitude,
          phone_number: place['phone_number'],
          place_type: place['place_type'],
        }
        File.write("#{@file_path}my_basket/#{index}.json", data.to_json)
      end
      sleep 2
    end    
  end
end
