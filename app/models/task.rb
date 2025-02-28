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
class Task < ApplicationRecord
  belongs_to :todo

  validates :title, presence: true, length: {maximum: 50}

  enum :priority, {low: 0, medium: 1, high: 2}, validate: true
end
