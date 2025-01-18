class AddMonthAndYearToBudgets < ActiveRecord::Migration[8.0]
  def change
    add_column :budgets, :month, :integer, null: false
    add_column :budgets, :year, :integer, null: false
  end
end
