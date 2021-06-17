class AddTitleToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :title, :string
    add_column :songs, :artist_name, :string
    add_column :songs, :released, :date
    add_column :songs, :song_description, :text
  end
end
