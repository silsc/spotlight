class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.bigint :user1_id
      t.bigint :user2_id
      t.timestamps
    end

    add_index :connections, :user1_id
    add_index :connections, :user2_id
  end
end
