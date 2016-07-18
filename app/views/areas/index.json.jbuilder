json.array!(@areas) do |area|
  json.extract! area, :id
  json.url area_url(area, format: :json)
end
