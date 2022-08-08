# frozen_string_literal: true

class AddImageToBoardGames < ActiveRecord::Migration[6.1]
  def change
    add_column :board_games, :image, :string
  end
end
