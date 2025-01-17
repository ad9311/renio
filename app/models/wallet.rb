# == Schema Information
#
# Table name: wallets
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_wallets_on_user_id  (user_id)
#

class Wallet < ApplicationRecord
  belongs_to :user
  has_many :budgets, dependent: :destroy
end
