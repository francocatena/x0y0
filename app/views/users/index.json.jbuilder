json.array!(@users) do |user|
  json.extract! user, :name, :lastname, :email
  json.url user_url(user, format: :json)
end
