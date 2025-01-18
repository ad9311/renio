require "rails_helper"

RSpec.describe Budgets::Edit do
  subject(:call) { described_class.call(budget:, params:) }

  let(:user) { create(:user) }
  let(:wallet) { create(:wallet, user:) }
  let(:budget) { create(:budget, wallet:) }

  context "when the amount is valid" do
    let(:params) { { amount: 100 } }

    it "updates the budget" do
      expect(call.success?).to be_truthy
    end
  end

  context "when the amount is invalid" do
    let(:params) { { amount: 0 } }

    it "does not update the budget" do
      expect(call.success?).to be_falsey
    end
  end
end
