require 'jp_prefecture'

# まいばすけっとの緯度経度情報の算出が間違っていたので一旦コメントアウト
# my_basket_places = JSON.parse(File.read('db/fixtures/my_basket_with_latlng.json'))
# my_basket_places.each do |place|
#   Place.create!(place)
# end

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
another_places = [
  {
    name: 'GARDEN HOUSE Shinjuku',
    prefecture_id: 13,
    address: '新宿区新宿4-1-6',
    address2: 'NEWoMan SHINJUKU 4F',
    phone_number: '03-3226-0566',
    latitude: 35.688569,
    longitude: 139.702641,
    place_type: 0
  },
  {
    name: 'タップスタンド',
    prefecture_id: 13,
    address: '新宿区新宿3-35-3',
    address2: '森治ビル 1F',
    phone_number: '03-3226-0566',
    latitude: 35.689855,
    longitude: 139.702761,
    place_type: 0
  },
  {
    name: 'WIZ CRAFT BEERandFOOD',
    prefecture_id: 13,
    address: '千代田区神田淡路町2-105',
    address2: 'ワテラスアネックス 108',
    phone_number: '03-3226-0566',
    latitude: 35.697572,
    longitude: 139.767905,
    place_type: 0
  }
]

another_places.each{|another_place_params| Place.create(another_place_params)}
