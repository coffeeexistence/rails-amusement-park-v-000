json.array!(@users) do |user|
  json.extract! user, :id, :name, :happiness, :nausea, :height, :tickets, :admin
  json.url user_url(user, format: :json)
end
