module Crawler
  module Searchable
    def page_source(url)
      return false if url.empty?
      begin
        RestClient.get(url) do |response|
          if response.code == 404
            return ''
          else
            response.body
          end
        end
      rescue SocketError => e
        return false
      end
    end

    def page_source_for_smartphone(url)
      return false if url.empty?
      user_agent = "Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H321 Safari/600.1.4"
      begin
        RestClient.get(url, user_agent: user_agent) do |response|
          if response.code == 404
            return ''
          else
            response.body
          end
        end
      rescue SocketError => e
        return false
      end
    end

    def redirected_url(url)
      return false if url.empty?
      begin
        RestClient.get(url, user_agent: "Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H321 Safari/600.1.4") do |response|
          if [301, 302, 307].include? response.code
            return URI.escape(response.headers[:location])
          end
        end
      rescue SocketError => e
        return false
      end
    end

    def to_price(str_price)
      return str_price.gsub(/[^0-9]/,"").to_i
    end
  end
end
