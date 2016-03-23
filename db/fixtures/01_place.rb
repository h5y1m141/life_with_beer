require 'jp_prefecture'
places = JSON.parse(File.read('db/fixtures/place.json'))
places.each do |place|
  place_type = (place['custom_fields']['shopFlg'] == 'false') ? 0 : 1
  Place.create({
    name: place['name'],
    prefecture_id: JpPrefecture::Prefecture.find(name: place['state']).code,
    address: (place['address']) ? place['address'] : '',
    phone_number: place['phone_number'],
    latitude: place['latitude'],
    longitude: place['longitude'],
    place_type: place_type
})
end
puts 'まいばすけっとの情報をスクレイピング'
my_basket_crawler = Crawler::MyBasket.new
my_basket_crawler.run.each{|place| Place.create!(place)}
