class Budgets::UpdateBalance
  include Callable

  attr_reader :budget, :credit, :debit, :params

  Result = Struct.new(:success?)

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
    Result.new(budget.update(balance:))
  end

  def balance
    budget.balance + (credit - debit)
  end
end
