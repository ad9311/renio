class RemoveCategorizedFromTodos < ActiveRecord::Migration[8.0]
  def change
    remove_column :todos, :categorized
  end
end
