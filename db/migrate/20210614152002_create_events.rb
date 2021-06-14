class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :organizable, polymorphic: true
      t.datetime :date
      t.string :name
      t.string :location
      t.string :event_url

      t.timestamps
    end
  end
end
