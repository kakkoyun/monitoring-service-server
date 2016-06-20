json.array!(@disk_usages) do |disk_usage|
  json.extract! disk_usage, :id
  json.url disk_usage_url(disk_usage, format: :json)
end
