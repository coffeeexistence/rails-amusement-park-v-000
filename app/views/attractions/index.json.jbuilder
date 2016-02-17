json.array!(@attractions) do |attraction|
  json.extract! attraction, :id, :name, :min_height, :nausea_rating, :happiness_rating, :tickets
  json.url attraction_url(attraction, format: :json)
end
