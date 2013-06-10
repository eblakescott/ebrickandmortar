json.array!(@stores) do |store|
  json.extract! store, :title, :description, :address, :image_url
  json.url store_url(store, format: :json)
end