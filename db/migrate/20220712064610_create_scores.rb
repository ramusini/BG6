# frozen_string_literal: true

class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.string :score, null: :false
      t.integer :player_id, null: :false
      t.integer :record_id, null: false

      t.timestamps
    end
  end
end
