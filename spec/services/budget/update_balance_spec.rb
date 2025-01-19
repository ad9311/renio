require "rails_helper"

RSpec.describe Budgets::UpdateBalance do
  subject(:call) { described_class.call(budget:, params:) }

  let(:user) { create(:user) }
  let(:wallet) { create(:wallet, user:) }
  let(:budget) { create(:budget, wallet:, amount: 1000) }

  context "when budget is credited" do
    let(:params) { { credit: 100, debit: 0 } }

    it "updates the budget balance" do
      expect(call.success?).to be_truthy
    end
  end
end
