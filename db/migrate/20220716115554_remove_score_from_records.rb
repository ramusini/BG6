# frozen_string_literal: true

class RemoveScoreFromRecords < ActiveRecord::Migration[6.1]
  def change
    remove_column :records, :score, :string
  end
end
