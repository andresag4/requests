json.array!(@categories) do |category|
  json.extract! category, :id, :name, :data_type
  json.url category_url(category, format: :json)
end
