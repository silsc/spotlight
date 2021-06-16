class AddRolesToArtist < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :roles, :string, array: true, default: []
  end
end
