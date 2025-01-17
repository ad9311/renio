class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :wallet, dependent: :destroy

  after_create :setup_accounts

  private

  def setup_accounts
    Users::Accounts::SetUp.call(user: self)
  end
end
