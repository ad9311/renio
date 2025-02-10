# frozen_string_literal: true

require 'rails_helper'

describe Users::Accounts::SetUp, type: :service do
  subject(:call) { described_class.call(user:) }

  let(:user) { create(:user) }

  before do
    user.wallet.destroy
  end

  it 'creates a wallet for the user' do
    expect { call }.to change { user.reload.wallet }.from(nil).to(an_instance_of(Wallet))
  end
end
