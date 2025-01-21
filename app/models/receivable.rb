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

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
end
