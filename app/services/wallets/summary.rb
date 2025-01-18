class Wallets::Summary
  include Callable

  attr_reader :user, :wallet, :current_budget

  def initialize(user:)
    @user = user
    @wallet = user.wallet
  end

  def call
    create_budget if current_budget.blank?

    {
      current_budget: current_budget,
      last_expense: current_budget.expenses.last
    }
  end

  private

  def current_budget
    @current_budget ||= wallet.budgets.where(month: month, year: year).first
  end

  def create_budget
    @create_budget = Budgets::Create.call(wallet: wallet)
  end

  def month
    Time.zone.now.month
  end

  def year
    Time.zone.now.year
  end
end
