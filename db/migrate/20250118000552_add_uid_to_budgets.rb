class AddUidToBudgets < ActiveRecord::Migration[8.0]
  def change
    add_column :budgets, :uid, :string, null: false

    add_index :budgets, :uid, unique: true
  end
end
