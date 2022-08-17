# frozen_string_literal: true

class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :board_games, :played_title, true
  end
end
