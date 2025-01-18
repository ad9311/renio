require 'rails_helper'

describe Budgets::Create, type: :service do
  subject(:call) { described_class.call(wallet:) }

  let(:user) { create(:user) }
  let(:wallet) { create(:wallet, user:) }

  it "creates a budget" do
    expect { call }.to change { wallet.budgets.count }.by(1)
  end

  it "creates a budget with the correct uid" do
    call
    expect(wallet.budgets.last.uid).to eq("#{wallet.id}-#{Time.zone.now.month}-#{Time.zone.now.year}")
  end
end
