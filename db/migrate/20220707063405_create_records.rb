class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.string :date, null: false
      t.string :score, null: false
      t.string :playing_time, null: false
      t.text :memo
      t.integer :user_id, null: false
      t.integer :player_id, null:false
      t.timestamps
    end
  end
end
