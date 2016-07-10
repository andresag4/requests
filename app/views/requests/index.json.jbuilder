json.array!(@requests) do |request|
  json.extract! request, :id, :folio, :reception_date, :data_type, :user_id, :entry_id
  json.url request_url(request, format: :json)
end
