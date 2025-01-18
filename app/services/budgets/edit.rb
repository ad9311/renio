class Budgets::Edit
  include Callable

  attr_reader :budget, :params

  Result = Struct.new(:success?)

  def initialize(budget:, params:)
    @budget = budget
    @params = params
  end

  def call
    validate_amount!

    Result.new(budget.update(params))
  end

  def validate_amount!
    params[:amount] = 0 if params[:amount].blank?
  end
end
