module TagSearchModule
  extend ActiveSupport::Concern
  included do
    include Elasticsearch::Model
    index_name "life_with_beer"
    settings index: {
      analysis: {
        filter: {
          synonym: {
            type: "synonym",
            synonyms_path: '/Users/hoyamada/Documents/elasticsearch/ver_220/config/analysis/synonym.txt'
          }
        },
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
          synonym: {
            tokenizer: "standard",
            filter: [ 'synonym' ]
          }
        }
      }
    } do
      mapping _source: { enabled: true },
      properties: { enabled: true, analyzer: "ngram_tokenizer" } do
        indexes :trendword_id, type: 'integer', index: 'not_analyzed'
        indexes :name, type: 'string', analyzer: 'synonym'
      end
    end
  end
  module ClassMethods
    def create_index!(options={})
      client = __elasticsearch__.client
      client.indices.delete index: "life_with_beer" rescue nil if options[:force]
      client.indices.create index: "life_with_beer",
      body: {
        settings: settings.to_hash,
        mappings: mappings.to_hash
      }
    end
  end
end
