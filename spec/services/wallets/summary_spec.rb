require "rails_helper"

describe Wallets::Summary, type: :service do
  subject(:call) { described_class.call(user:) }

  let(:user) { create(:user) }
  let(:wallet) { create(:wallet, user:) }
  let(:month) { Time.zone.now.month }
  let(:year) { Time.zone.now.year }

  context "when there is a current budget" do
    before do
      create(:budget, wallet:)
    end

    it "returns the current budget" do
      expect(call[:current_budget]).to eq(wallet.budgets.where(month:, year:).first)
    end
  end

  context "when there is no current budget" do
    it "creates a new budget" do
      expect { call }.to change { wallet.budgets.count }.by(1)
    end
  end

  context "when there is no last expense" do
    it "returns nil" do
      expect(call[:last_expense]).to be_nil
    end
  end

  context "when there is a last expense" do
    before do
      wallet
    end

    it "returns the last expense" do
      expect(call[:last_expense]).to eq(wallet.budgets.where(month:, year:).first.expenses.last)
    end
  end
end
