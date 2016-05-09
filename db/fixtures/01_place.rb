require 'jp_prefecture'

my_basket_places = JSON.parse(File.read('db/fixtures/my_basket_with_latlng.json'))
my_basket_places.each do |place|
  Place.create!(place)
end
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
