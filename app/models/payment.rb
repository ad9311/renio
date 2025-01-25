# == Schema Information
#
# Table name: payments
#
#  id                    :bigint           not null, primary key
#  amount                :decimal(10, 2)   not null
#  date_received         :date             not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  account_receivable_id :bigint           not null
#
# Indexes
#
#  index_payments_on_account_receivable_id  (account_receivable_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_receivable_id => account_receivables.id)
#
class Payment < ApplicationRecord
  belongs_to :account_receivable

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :date_received, presence: true

  after_create :update_account_total_payments_on_create
  after_update :update_account_total_payments_on_update
  after_destroy :update_account_total_payments_on_destroy

  private

  def update_account_total_payments_on_create
    params = { credit: amount, debit: 0 }
    update_account_total_payments(params:)
  end

  def update_account_total_payments_on_update
    if previous_changes.include?(:amount)
      old_amount, new_amount = previous_changes[:amount]
      params = { credit: new_amount, debit: old_amount }
      update_account_total_payments(params:)
    end
  end

  def update_account_total_payments_on_destroy
    params = { credit: 0, debit: amount }
    update_account_total_payments(params:)
  end

  def update_account_total_payments(params:)
    result = AccountReceivables::UpdateTotalPayments.call(account_receivable:, params:)
    raise "Failed to update account total payments: #{result.inspect}" unless result.success?
  end
end
