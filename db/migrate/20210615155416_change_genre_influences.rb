class ChangeGenreInfluences < ActiveRecord::Migration[6.0]
  def change
    remove_column :artists, :genres
    remove_column :artists, :influences
    add_column :artists, :genres, :string, array: true, default: []
    add_column :artists, :influences, :string, array: true, default: []
  end
end
