json.array!(@stores) do |store|
  json.extract! store, :id, :name, :furigana, :url
  json.url store_url(store, format: :json)
end
