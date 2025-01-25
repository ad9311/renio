class AccountReceivables::UpdateTotalPayments
  include Callable

  attr_reader :account_receivable, :credit, :debit, :params

  Result = Struct.new(:success?, :errors)

  def initialize(account_receivable:, params:)
    @account_receivable = account_receivable
    @credit = params[:credit]
    @debit = params[:debit]
    @params = params
  end

  def call
    update_total_payments
  end

  private

  def update_total_payments
    result = account_receivable.update(total_payments:)
    Result.new(result, account_receivable.errors.full_messages)
  end

  def total_payments
    account_receivable.total_payments + credit - debit
  end
end
