# == Schema Information
#
# Table name: account_receivables
#
#  id         :bigint           not null, primary key
#  balance    :decimal(10, 2)   default(0.0), not null
#  debtor     :string           not null
#  status     :integer          default("pending"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  wallet_id  :bigint           not null
#
# Indexes
#
#  index_account_receivables_on_wallet_id  (wallet_id)
#
# Foreign Keys
#
#  fk_rails_...  (wallet_id => wallets.id)
#
class AccountReceivable < ApplicationRecord
  belongs_to :wallet

  has_many :receivables

  validates :balance, numericality: { greater_than_or_equal_to: 0 }
  validates :debtor, presence: true, length: { maximum: 20 }

  enum :status, { pending: 0, paid: 1, canceled: 2 }
end
