class CreateExpenses < ActiveRecord::Migration[8.0]
  def change
    create_table :expenses do |t|
      t.references :expense_category, null: false, foreign_key: true
      t.references :budget, null: false, foreign_key: true

      t.string :description, null: false, default: ''
      t.decimal :amount, null: false, precision: 10, scale: 2, default: 0

      t.timestamps
    end
  end
end
