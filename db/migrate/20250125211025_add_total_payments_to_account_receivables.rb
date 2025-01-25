class AddTotalPaymentsToAccountReceivables < ActiveRecord::Migration[8.0]
  def change
    add_column :account_receivables, :total_payments, :decimal, null: false, precision: 10, scale: 2, default: 0
  end
end
