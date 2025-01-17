class Users::Accounts::SetUp
  include Callable

  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def call
    Rails.logger.info("Setup user account for user #{user.id}")

    user.create_wallet
  end
end
