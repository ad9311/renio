# == Schema Information
#
# Table name: budgets
#
#  id         :bigint           not null, primary key
#  amount     :decimal(10, 2)   default(0.0), not null
#  balance    :decimal(10, 2)   default(0.0), not null
#  month      :integer          not null
#  uid        :string           not null
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  wallet_id  :bigint           not null
#
# Indexes
#
#  index_budgets_on_uid        (uid) UNIQUE
#  index_budgets_on_wallet_id  (wallet_id)
#
# Foreign Keys
#
#  fk_rails_...  (wallet_id => wallets.id)
#
class Budget < ApplicationRecord
  belongs_to :wallet

  has_many :expenses, dependent: :destroy

  validates :amount, :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :balance, numericality: { less_than_or_equal_to: :amount }
  validates :uid, presence: true, uniqueness: true
end
