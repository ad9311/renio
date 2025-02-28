class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.references :todo, null: false, foreign_key: true
      t.string :title
      t.integer :priority
      t.boolean :done

      t.timestamps
    end
  end
end
