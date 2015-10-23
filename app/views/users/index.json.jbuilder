json.array!(@users) do |user|
  json.extract! user, :id, :name, :GovID, :address, :AuthNum
  json.url user_url(user, format: :json)
end
