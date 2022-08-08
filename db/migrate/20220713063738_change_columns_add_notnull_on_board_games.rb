# frozen_string_literal: true

class ChangeColumnsAddNotnullOnBoardGames < ActiveRecord::Migration[6.1]
  def change
    change_column :board_games, :bg_id, :integer, null: false
    change_column :scores, :score, :string, null: false
    change_column :scores, :player_id, :integer, null: false
  end
end
