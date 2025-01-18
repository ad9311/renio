class AddUidToExpenseCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :expense_categories, :uid, :string

    add_index :expense_categories, :uid, unique: true
  end
end
