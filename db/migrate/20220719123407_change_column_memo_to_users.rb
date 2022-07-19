class ChangeColumnMemoToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :memo, nil
  end
end
