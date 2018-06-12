json.cache! ['api', @places], expires_in: 10.minutes do
  json.set! :url, request.path_info
  json.places do
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
  json.pagination do
    json.page @places.current_page
    json.total_places @places.total_count
  end
end
