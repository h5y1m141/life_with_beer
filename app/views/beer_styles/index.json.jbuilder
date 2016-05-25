json.array!(@beer_styles) do |beer_style|
  json.extract! beer_style, :id, :name, :full_bodied_ratio, :bitter_taste_ratio, :aroma_ratio
  json.url beer_style_url(beer_style, format: :json)
end
