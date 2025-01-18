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
    puts "##########"
    puts budget.valid?
    puts "##########"
    return Result.new(false) unless budget.valid?

    budget.update!(params)
    Result.new(true)
  end

  def validate_amount!
    budget.errors.add(:amount, "can't be blank") and return if params[:amount].blank?

    budget.errors.add(:amount, "can't be zero") if params[:amount].to_f.zero?
  end
end
