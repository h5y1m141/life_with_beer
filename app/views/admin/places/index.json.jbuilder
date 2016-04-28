json.cache! ['v1', @places], expires_in: 10.minutes do
  json.array! @places do |place|
    json.id place[:id]
    json.name place[:name]
    json.prefecture place.prefecture.name
    json.address place[:address]
    json.address2 place[:address2]
    json.phone_number place[:phone_number]
    json.latitude place[:latitude]
    json.longitude place[:longitude]
    json.place_type place[:place_type]
  end
end
