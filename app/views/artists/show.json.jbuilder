json.extract! @artist, :id, :name, :location, :website_url, :bio, :genres, :influences, :soundcloud_url, :youtube_url,
              :instagram_url
json.songs @artist.songs do |song|
  json.extract! song, :id
end
