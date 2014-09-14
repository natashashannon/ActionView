json.array!(@foods) do |food|
  json.extract! food, :id, :name, :expiration_date, :qty, :description
  json.url food_url(food, format: :json)
end
