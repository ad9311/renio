class Budgets::UpdateTotalExpenses
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
    update_budget_total_expenses
  end

  private

  def update_budget_total_expenses
    result = budget.update(total_expenses:)
    Result.new(result, budget.errors.full_messages)
  end

  def total_expenses
    budget.total_expenses + credit - debit
  end
end
