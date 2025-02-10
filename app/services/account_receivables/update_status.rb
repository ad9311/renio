# frozen_string_literal: true

class AccountReceivables::UpdateStatus
  include Callable

  attr_reader :account_receivable

  Result = Struct.new(:message)

  def initialize(account_receivable:)
    @account_receivable = account_receivable
  end

  def call
    status_updated = ''

    if account_receivable.canceled?
      when_canceled
      status_updated = 'activated'
    else
      account_receivable.canceled!
      status_updated = 'canceled'
    end

    Result.new(message(status_updated))
  end

  private

  def when_canceled
    if account_receivable.balance.zero?
      account_receivable.paid!
    else
      account_receivable.pending!
    end
  end

  def message(status_updated)
    "Account receivable #{status_updated} successfully"
  end
end
