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
FactoryBot.define do
  factory :budget do
    wallet { nil }
    uid { "#{wallet.id}-#{Time.zone.now.month}-#{Time.zone.now.year}" }
    month { Time.zone.now.month }
    year { Time.zone.now.year }
    amount { "0.0" }
    balance { "0.0" }
  end
end
