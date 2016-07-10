json.array!(@permissions) do |permission|
  json.extract! permission, :id, :name, :description, :action, :controller
  json.url permission_url(permission, format: :json)
end
