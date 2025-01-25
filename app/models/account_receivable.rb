# == Schema Information
#
# Table name: account_receivables
#
#  id                :bigint           not null, primary key
#  debtor            :string           not null
#  status            :integer          default("pending"), not null
#  total_payments    :decimal(10, 2)   default(0.0), not null
#  total_receivables :decimal(10, 2)   default(0.0), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  wallet_id         :bigint           not null
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

  has_many :receivables, dependent: :destroy
  has_many :payments, dependent: :destroy

  validates :debtor, presence: true, length: { maximum: 20 }
  validates :total_receivables, :total_payments, numericality: { greater_than_or_equal_to: 0 }

  enum :status, { pending: 0, paid: 1, canceled: 2 }

  def balance
    total_receivables - total_payments
  end
end
