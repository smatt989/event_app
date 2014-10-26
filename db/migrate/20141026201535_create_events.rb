class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.datetime :startTime
      t.datetime :endTime
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :events, [:user_id, :created_at]
  end
end
