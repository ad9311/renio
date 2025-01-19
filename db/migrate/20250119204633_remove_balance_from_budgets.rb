class RemoveBalanceFromBudgets < ActiveRecord::Migration[8.0]
  def up
    remove_column :budgets, :balance
  end

  def down
    add_column :budgets, :balance, :decimal, null: false, precision: 10, scale: 2, default: 0
  end
end
