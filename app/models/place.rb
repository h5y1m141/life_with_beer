require 'elasticsearch/model'

class Place < ActiveRecord::Base
  include JpPrefecture
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  include GeoModule
  after_create :generate_geohash  
  jp_prefecture :prefecture_id
  enum place_type: { restaurant: 0, shop: 1, place: 2 }
  has_many :favorites, as: :favoriteable
  has_many :place_item_relays, dependent: :destroy
  has_many :items, through: :place_item_relays
  has_many :place_social_account_relays, dependent: :destroy
  has_many :social_accounts, through: :place_social_account_relays  
  accepts_nested_attributes_for :social_accounts
  
  def self.place_type_list
    result = []
    self.place_types.keys.each_with_index do|account, index|
      result.push([account, index])
    end
    result
  end

  def self.prefectures
    JpPrefecture::Prefecture.all.map{|o| [o.name, o.code]}
  end

  def self.prefectures_with_key
    JpPrefecture::Prefecture.all.map do |o|
      {
        name: o.name,
        code: o.code
      }
    end
  end

  def self.create_index!(options={})
    client = __elasticsearch__.client
    settings index: {
               analysis: {
                 tokenizer: {
                   ngram_tokenizer: {
                     type: 'nGram',
                     min_gram: '2',
                     max_gram: '3',
                     token_chars: ['letter', 'digit']
                   }
                 },                 
                 analyzer: {
                   ngram_analyzer: {
                     tokenizer: "ngram_tokenizer"
                   },
                   kuromoji_analyzer: {
                     tokenizer: 'kuromoji_tokenizer',
                     filter:    ['kuromoji_baseform'],
                   }
                 }
               }
             } do
      mapping _source: { enabled: true },
      properties: { enabled: true, analyzer: 'kuromoji_analyzer' } do
        indexes :trendword_id, type: :integer, index: 'not_analyzed'
        indexes :name, type: :string, index: 'analyzed', analyzer: 'kuromoji_analyzer'
        indexes :location, type: :geo_point, lat_lon: true
      end
    end
    client.indices.delete index: 'places' rescue nil if options[:force]
    client.indices.create index: 'places',
      body: {
        settings: settings.to_hash,
        mappings: mappings.to_hash
      }
  end
  def as_indexed_json(options = {})
    {
      id: id,
      name: name,
      address: address,
      latitude: latitude.to_f,
      longitude: longitude.to_f,
      location: "#{latitude.to_f},#{longitude.to_f}"
    }
  end
end
