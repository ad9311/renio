class Budgets::Create
  include Callable

  attr_reader :wallet

  def initialize(wallet:)
    @wallet = wallet
  end

  def call
    Budget.create!(params)
  end

  private

  def params
    {
      wallet: wallet,
      month:,
      year:,
      uid: uid
    }
  end

  def uid
    "#{wallet.id}-#{month}-#{year}"
  end

  def month
    Time.zone.now.month
  end

  def year
    Time.zone.now.year
  end
end
