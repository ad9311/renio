class CreateAccountReceivables < ActiveRecord::Migration[8.0]
  def change
    create_table :account_receivables do |t|
      t.references :wallet, null: false, foreign_key: true

      t.string :debtor, null: false
      t.decimal :balance, null: false, precision: 10, scale: 2, default: 0
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
