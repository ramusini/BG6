class ChangeColumnmemoToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :memo, from: true, to: false
  end
end
