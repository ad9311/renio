# == Schema Information
#
# Table name: account_receivables
#
#  id         :bigint           not null, primary key
#  balance    :decimal(10, 2)   default(0.0), not null
#  debtor     :string           not null
#  status     :integer          default(0), not null
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
FactoryBot.define do
  factory :account_receivable do
    association :wallet
    debtor { Faker::Name.name }
    balance { "9.99" }
    status { :pending }
  end
end
