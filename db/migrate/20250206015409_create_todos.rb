class CreateTodos < ActiveRecord::Migration[8.0]
  def change
    create_table :todos do |t|
      t.references :user, null: false, foreign_key: true

      t.string :title, null: false
      t.boolean :categorized, null: false, default: false

      t.timestamps
    end
  end
end
