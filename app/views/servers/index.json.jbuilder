json.array!(@servers) do |server|
  json.extract! server, :id, :name, :application_id
  json.url server_url(server, format: :json)
end
