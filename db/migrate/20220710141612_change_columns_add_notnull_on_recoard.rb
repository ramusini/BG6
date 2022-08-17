# frozen_string_literal: true

class ChangeColumnsAddNotnullOnRecoard < ActiveRecord::Migration[6.1]
  def change
    change_column_null :records, :board_game_id, false
  end
end
