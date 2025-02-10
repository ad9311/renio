# frozen_string_literal: true

class Budgets::CreateNext
  include Callable

  attr_reader :wallet

  Result = Struct.new(:success?, :errors, :budget)

  def initialize(wallet:)
    @wallet = wallet
  end

  def call
    create_next_budget
  end

  private

  def create_next_budget
    current_date = Time.zone.now
    next_date = current_date + 1.month

    new_budget = wallet.budgets.new(
      month: next_date.month,
      year: next_date.year,
    )

    new_budget.save

    Result.new(new_budget.persisted?, new_budget.errors.full_messages, new_budget)
  end
end
