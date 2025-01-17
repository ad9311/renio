class Budget < ApplicationRecord
  belongs_to :wallet

  validates :amount, :balance, numericality: { greater_than_or_equal_to: 0 }
  validates :balance, numericality: { less_than_or_equal_to: :amount }
end
