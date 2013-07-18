json.array!(@shoes) do |shoe|
  json.extract! shoe, :title, :description, :image_url, :price, :sex, :store_id
  json.url shoe_url(shoe, format: :json)
end