# frozen_string_literal: true

class AddBgIdToBoardGames < ActiveRecord::Migration[6.1]
  def change
    add_column :board_games, :bg_id, :integer
  end
end
