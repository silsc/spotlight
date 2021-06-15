json.extract! @label, :id, :name, :location, :website_url, :bio
json.artists @label.artists do |artist|
  json.extract! artist, :id, :name, :age, :location
end
