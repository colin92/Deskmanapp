json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :desk_id, :password, :role
  json.url user_url(user, format: :json)
end
