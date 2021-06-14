class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :soundcloud_url
      t.string :youtube_url
      t.string :instagram_url
      t.text :bio
      t.string :name
      t.integer :age
      t.string :location
      t.references :label, null: true, foreign_key: true
      t.string :website_url

      t.timestamps
    end
  end
end
