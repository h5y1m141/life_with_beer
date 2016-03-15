json.items do
  json.array! @items do |item|
    json.name item.name
    json.thumbnail do
      json.width item.thumbnail.width
      json.height item.thumbnail.height
      json.image item.thumbnail.image.medium_thumb.url
    end
    json.brand_name item.brand.name
    json.pictures do
      json.array! item.pictures do |picture|
        json.picture_id picture.id
        json.picture_image picture.image.url
      end
    end
  end
end
