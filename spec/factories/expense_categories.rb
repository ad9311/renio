# == Schema Information
#
# Table name: expense_categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_expense_categories_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :expense_category do
    name { "Test category" }
  end
end
