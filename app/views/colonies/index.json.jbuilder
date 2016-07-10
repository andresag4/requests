json.array!(@colonies) do |colony|
  json.extract! colony, :id, :name, :postcode, :city_id
  json.url colony_url(colony, format: :json)
end
