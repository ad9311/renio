# frozen_string_literal: true

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
FactoryBot.define do
  factory :receivable do
    association :account_receivable
    description { 'Test' }
    amount { '9.99 ' }
  end
end
