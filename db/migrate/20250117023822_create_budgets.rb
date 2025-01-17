class CreateBudgets < ActiveRecord::Migration[8.0]
  def change
    create_table :budgets do |t|
      t.references :wallet, null: false, foreign_key: true

      t.decimal :amount, null: false, precision: 10, scale: 2, default: 0
      t.decimal :balance, null: false, precision: 10, scale: 2, default: 0

      t.timestamps
    end
  end
end
