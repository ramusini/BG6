# frozen_string_literal: true

class AddBoardGameIdToRecord < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :board_game_id, :integer
  end
end
