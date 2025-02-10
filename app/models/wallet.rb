# frozen_string_literal: true

# == Schema Information
#
# Table name: wallets
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_wallets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Wallet < ApplicationRecord
  belongs_to :user

  has_many :budgets, dependent: :destroy
  has_many :account_receivables, dependent: :destroy

  def current_budget
    uid = "#{id}-#{Time.zone.today.month}-#{Time.zone.today.year}"
    budgets.find_by(uid:)
  end
end
