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
  validate :validate_amount_on_create, on: :create
  validate :validate_amount_on_update, on: :update

  validates :date_received, presence: true
  validate :validate_date_received

  after_create :update_account_total_payments_on_create
  after_create :update_status

  after_update :update_account_total_payments_on_update
  after_update :update_status

  after_destroy :update_account_total_payments_on_destroy
  after_destroy :update_status

  private

  def amount_error
    errors.add(:amount, "can't be greater than the account receivable balance")
  end

  def validate_amount_on_create
    amount_error if amount > account_receivable.balance
  end

  def validate_amount_on_update
    if amount_changed?
      total_payments = account_receivable.total_payments + amount - amount_was
      balance = account_receivable.total_receivables - total_payments
      amount_error if balance.negative?
    end
  end

  def validate_date_received
    errors.add(:date_received, "can't be in the future") if date_received > Time.zone.today
  end

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

  def update_status
    return if account_receivable.canceled?

    account_receivable.paid! and return if account_receivable.balance.zero?

    account_receivable.pending!
  end
end
