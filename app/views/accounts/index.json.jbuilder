json.array!(@accounts) do |account|
  json.extract! account, :id, :name, :value, :critical_value, :notification
  json.url account_url(account, format: :json)
end
