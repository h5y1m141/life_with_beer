json.image do
  json.id @picture.id
  json.image do
    json.url @picture.image.url
  end
end
