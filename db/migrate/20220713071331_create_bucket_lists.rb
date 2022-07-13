class CreateBucketLists < ActiveRecord::Migration[6.1]
  def change
    create_table :bucket_lists do |t|
      t.string :bg_title, null: false
      t.string :minplayer
      t.string :maxplayer
      t.string :playingtime
      t.string :rate
      t.string :image
      t.text :memo
      t.integer :user_id, null: false
      t.integer :bg_id, null: false

      t.timestamps
    end
  end
end
