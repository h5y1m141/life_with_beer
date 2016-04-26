json.items do
  json.array! @items do |item|
    json.id item.id
    json.name item.name
    json.image do
      json.url item.image.url
      json.medium_thumb = item.image.medium_thumb.url
      json.small_thumb = item.image.small_thumb.url
    end
  end
end
