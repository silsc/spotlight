class AddInfluencesAndGenresToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :influences, :string
    add_column :artists, :genres, :string
  end
end
