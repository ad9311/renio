class Wallets::Summary
  include Callable

  attr_reader :user, :wallet, :current_budget

  def initialize(user:)
    @user = user
    @wallet = user.wallet
  end

  def call
    return {} if current_budget.blank?

    {
      current_budget: current_budget,
      last_expense: current_budget.expenses.last
    }
  end

  private

  def current_budget
    @current_budget ||= wallet.budgets.last
  end
end
