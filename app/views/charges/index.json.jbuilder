json.array!(@charges) do |charge|
  json.extract! charge, 
  json.url charge_url(charge, format: :json)
end