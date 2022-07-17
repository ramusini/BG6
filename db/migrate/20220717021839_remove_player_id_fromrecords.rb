class RemovePlayerIdFromrecords < ActiveRecord::Migration[6.1]
  def change
    remove_column :records, :player_id
  end
end
