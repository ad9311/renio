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
FactoryBot.define do
  factory :expense do
    expense_category { nil }
    budget { nil }
    description { "Test description" }
    amount { "9.99" }
  end
end
