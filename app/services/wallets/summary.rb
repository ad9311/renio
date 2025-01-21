class Wallets::Summary
  include Callable

  attr_reader :user, :wallet, :current_budget

  Result = Struct.new(:summary)

  def initialize(user:)
    @user = user
    @wallet = user.wallet
  end

  def call
    create_budget if current_budget.blank?

    Result.new({
      current_budget: current_budget,
      last_expense: current_budget.expenses.last,
      last_account_receivable: wallet.account_receivables.last
    })
  end

  private

  def current_budget
    @current_budget ||= wallet.budgets.where(month: month, year: year).first
  end

  def create_budget
    budget = Budget.create(wallet:, month:, year:)
    raise "Failed to create budget" unless budget.persisted?

    @current_budget = budget
  end

  def month
    Time.zone.now.month
  end

  def year
    Time.zone.now.year
  end
end
