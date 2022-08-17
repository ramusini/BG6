# frozen_string_literal: true

class RenameBgTitleColumnToTitle < ActiveRecord::Migration[6.1]
  def change
    rename_column :bucket_lists, :bg_title, :bucket_title
    rename_column :board_games, :bg_title, :played_title
  end
end
