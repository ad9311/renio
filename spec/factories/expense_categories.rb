# frozen_string_literal: true

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
FactoryBot.define do
  factory :expense_category do
    name { nil }
    uid { nil }
  end
end
