class ChangeMemoToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :memo, from: nil, to: "しがないボードゲーマー"
  end
end
