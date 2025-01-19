class Budgets::UpdateBalance
  include Callable

  attr_reader :budget, :credit, :debit, :params

  Result = Struct.new(:success?, :errors)

  def initialize(budget:, params:)
    @budget = budget
    @credit = params[:credit]
    @debit = params[:debit]
    @params = params
  end

  def call
    update_budget_balance
  end

  private

  def update_budget_balance
    result = budget.update(balance:)
    Result.new(result, budget.errors.full_messages)
  end

  def balance
    budget.amount - budget.balance + credit - debit
  end
end
