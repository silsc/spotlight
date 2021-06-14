class CreateLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :labels do |t|
      t.references :user, null: false, foreign_key: true
      t.text :bio
      t.string :name
      t.string :location
      t.string :website_url

      t.timestamps
    end
  end
end
