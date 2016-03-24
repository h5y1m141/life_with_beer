class Crawler::MyBasket < Crawler::Base
  include Crawler::Searchable

  def initialize
    super
    @base_url = 'http://www.e-map.ne.jp'
  end
  def run
    fetch_places
  end
  def fetch_places
    url = 'http://www.aeonretail.jp/shop/mblist.html'
    page = Nokogiri::HTML.parse(page_source(url))
    places = []
    shop_names = page.xpath('//tr[@class="vcard"]/td[@class="fn org"]').map{|node| node.text }
    postal_codes = page.xpath('//tr[@class="vcard"]/td[@class="postal-code"]').map{|node| node.text }
    prefectures = page.xpath('//tr[@class="vcard"]/td[@class="adr"]').map { |node| node.xpath('./span[@class="region"]').text.squish.match(/東京都|神奈川県/).to_s }
    addresses = page.xpath('//tr[@class="vcard"]/td[@class="adr"]').map { |node| node.xpath('./span[@class="locality"]').text + node.xpath('./span[@class="street-address"]').text }
    telephones = page.xpath('//tr[@class="vcard"]/td[@class="tel"]').map{|node| node.text }
    shop_names.each_with_index do|shop, index|
      unless prefectures[index].empty?
        places.push({
          name: shop,
          prefecture_id: JpPrefecture::Prefecture.find(name: prefectures[index]).code,
          address: addresses[index],
          phone_number: telephones[index],
          place_type: 1
        })
      end
    end
    places
  end
end
