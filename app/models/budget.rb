class Budget < ApplicationRecord
  belongs_to :wallet

  has_many :expenses, dependent: :destroy

  validates :amount, :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :balance, numericality: { less_than_or_equal_to: :amount }
  validates :uid, presence: true, uniqueness: true
end
