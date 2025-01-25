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
FactoryBot.define do
  factory :account_receivable do
    association :wallet
    debtor { Faker::Name.name }
    status { :pending }
  end
end
