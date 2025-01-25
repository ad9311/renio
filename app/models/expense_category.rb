# == Schema Information
#
# Table name: expense_categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_expense_categories_on_name  (name) UNIQUE
#  index_expense_categories_on_uid   (uid) UNIQUE
#
class ExpenseCategory < ApplicationRecord
  has_many :expenses, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :uid, presence: true, uniqueness: true
end
