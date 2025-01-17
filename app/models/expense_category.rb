# == Schema Information
#
# Table name: expense_categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_expense_categories_on_name  (name) UNIQUE
#

class ExpenseCategory < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
end
