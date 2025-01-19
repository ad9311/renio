class AddTotalExpensesToBudgets < ActiveRecord::Migration[8.0]
  def change
    add_column :budgets, :total_expenses, :decimal, null: false, precision: 10, scale: 2, default: 0
  end
end
