# frozen_string_literal: true

# == Schema Information
#
# Table name: receivables
#
#  id                    :bigint           not null, primary key
#  amount                :decimal(10, 2)   default(0.0), not null
#  description           :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  account_receivable_id :bigint           not null
#
# Indexes
#
#  index_receivables_on_account_receivable_id  (account_receivable_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_receivable_id => account_receivables.id)
#
class Receivable < ApplicationRecord
  belongs_to :account_receivable

  validates :amount, presence: true, numericality: {greater_than: 0}
  validates :description, presence: true, length: {maximum: 50}

  after_create :update_account_total_receivables_on_create
  after_update :update_account_total_receivables_on_update
  after_destroy :update_account_total_receivables_on_destroy

  private

  def update_account_total_receivables_on_create
    params = {credit: amount, debit: 0}
    update_account_total_receivables(params:)
  end

  def update_account_total_receivables_on_update
    return unless previous_changes.include?(:amount)

    old_amount, new_amount = previous_changes[:amount]
    params = {credit: new_amount, debit: old_amount}
    update_account_total_receivables(params:)
  end

  def update_account_total_receivables_on_destroy
    params = {credit: 0, debit: amount}
    update_account_total_receivables(params:)
  end

  def update_account_total_receivables(params:)
    result = AccountReceivables::UpdateTotalReceivables.call(account_receivable:, params:)
    raise "Failed to update account total receivables: #{result.inspect}" unless result.success?
  end
end
