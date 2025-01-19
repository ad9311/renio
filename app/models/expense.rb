# == Schema Information
#
# Table name: expenses
#
#  id                  :bigint           not null, primary key
#  amount              :decimal(10, 2)   default(0.0), not null
#  description         :string           default(""), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  budget_id           :bigint           not null
#  expense_category_id :bigint           not null
#
# Indexes
#
#  index_expenses_on_budget_id            (budget_id)
#  index_expenses_on_expense_category_id  (expense_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (budget_id => budgets.id)
#  fk_rails_...  (expense_category_id => expense_categories.id)
#
class Expense < ApplicationRecord
  belongs_to :expense_category
  belongs_to :budget

  validates :amount, presence: true, numericality: { greater_than: 0 }

  after_create :update_budget_balance_on_create
  after_update :update_budget_balance_on_update
  after_destroy :update_budget_balance_on_destroy

  private

  def update_budget_balance_on_create
    params = { credit: amount, debit: 0 }
    update_budget_balance(params:)
  end

  def update_budget_balance_on_update
    if previous_changes.include?(:amount)
      old_amount, new_amount = previous_changes[:amount]
      params = { credit: new_amount, debit: old_amount }
      update_budget_balance(params:)
    end
  end

  def update_budget_balance_on_destroy
    params = { credit: 0, debit: amount }
    update_budget_balance(params:)
  end

  def update_budget_balance(params:)
    result = Budgets::UpdateBalance.call(budget:, params:)
    raise "Failed to update budget balance: #{result.inspect}" unless result.success?
  end
end
