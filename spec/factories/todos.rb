# frozen_string_literal: true

# == Schema Information
#
# Table name: todos
#
#  id          :bigint           not null, primary key
#  categorized :boolean          default(FALSE), not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_todos_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :todo do
    user { nil }
    title { 'MyString' }
    categorized { false }
  end
end
