class AddDateToPayments < ActiveRecord::Migration[8.0]
  def change
    add_column :payments, :date_received, :date, null: false
  end
end
