# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :player_name, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
