class ChangeColumnDefaultToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :memo, from: "しがないボードゲーマー", to: nil
  end
end
