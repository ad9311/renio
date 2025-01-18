class Expense < ApplicationRecord
  belongs_to :expense_category
  belongs_to :budget

  validates :amount, presence: true, numericality: { greater_than: 0 }
end
