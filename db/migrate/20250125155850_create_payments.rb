class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :account_receivable, null: false, foreign_key: true
      t.decimal :amount, null: false, precision: 10, scale: 2

      t.timestamps
    end
  end
end
