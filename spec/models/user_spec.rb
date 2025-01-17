require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating a user' do
    it 'creates a wallet' do
      user = create(:user)
      user.reload

      expect(user.wallet).to be_present
      expect(user.wallet).to be_an(Wallet)
      expect(user.wallet.user).to eq(user)
    end
  end
end
