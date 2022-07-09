class CreateBoardGames < ActiveRecord::Migration[6.1]
  def change
    create_table :board_games do |t|
      t.string :bg_title, null: false
      t.string :minplayer
      t.string :maxplayer
      t.string :playingtime
      t.string :rate
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
