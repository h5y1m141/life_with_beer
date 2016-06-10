json.cache! ['v1', @places], expires_in: 10.minutes do
  json.array! @places do |place|
    json.partial! 'admin/places/detail', place: place
  end
end
