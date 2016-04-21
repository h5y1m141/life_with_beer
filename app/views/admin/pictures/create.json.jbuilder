json.id @picture.id
json.image do
  json.url @picture.image.url
  json.small_thumb @picture.image.small_thumb.url
  json.medium_thumb @picture.image.medium_thumb.url
end
