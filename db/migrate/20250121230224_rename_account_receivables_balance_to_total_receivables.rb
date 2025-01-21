class RenameAccountReceivablesBalanceToTotalReceivables < ActiveRecord::Migration[8.0]
  def change
    rename_column :account_receivables, :balance, :total_receivables
  end
end
