class CreateEventShares < ActiveRecord::Migration
  def change
    create_table :event_shares do |t|
      t.integer :event_id
      t.integer :sharer_id

      t.timestamps null: false
    end

    add_index :event_shares, :event_id
    add_index :event_shares, :sharer_id
    add_index :event_shares, [:event_id, :sharer_id], unique: true
  end
end
