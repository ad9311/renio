# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  done       :boolean
#  priority   :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  todo_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_todo_id  (todo_id)
#
# Foreign Keys
#
#  fk_rails_...  (todo_id => todos.id)
#
FactoryBot.define do
  factory :task do
    association :todo
    title { 'Task 1' }
    priority { 1 }
    done { false }
  end
end
