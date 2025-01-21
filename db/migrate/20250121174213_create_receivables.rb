class CreateReceivables < ActiveRecord::Migration[8.0]
  def change
    create_table :receivables do |t|
      t.references :account_receivable, null: false, foreign_key: true

      t.string :description, null: false
      t.decimal :amount, null: false, precision: 10, scale: 2, default: 0

      t.timestamps
    end
  end
end
