class AccountReceivables::UpdateTotalReceivables
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
    update_total_receivables
  end

  private

  def update_total_receivables
    result = account_receivable.update(total_receivables:)
    Result.new(result, account_receivable.errors.full_messages)
  end

  def total_receivables
    account_receivable.total_receivables + credit - debit
  end
end
