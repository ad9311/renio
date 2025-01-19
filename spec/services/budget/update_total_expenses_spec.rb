require "rails_helper"

RSpec.shared_examples "Budgets::UpdateTotalExpenses updates the budget total expenses" do |amount|
  it "has the correct total expenses" do
    call
    expect(budget.total_expenses).to eq(amount)
  end
end

RSpec.describe Budgets::UpdateTotalExpenses do
  subject(:call) { described_class.call(budget:, params:) }

  let(:budget) { create(:budget) }
  let(:expense_category) do
    create(:expense_category, name: "Test category", uid: "test_category")
  end

  before do
    budget.update(amount: 1000)
  end

  context "when the result is successful" do
    let(:params) { { credit: 100, debit: 0 } }
    it "returns a successful result" do
      expect(call.success?).to be_truthy
    end
  end

  context "when the result is not successful" do
    before do
      allow(budget).to receive(:update).and_return(false)
    end

    let(:params) { { credit: 0, debit: 0 } }

    it "returns a failed result" do
      expect(call.success?).to be_falsey
    end
  end

  context "when expense is created" do
    let(:params) { { credit: 100, debit: 0 } }

    it_behaves_like "Budgets::UpdateTotalExpenses updates the budget total expenses", 100
  end

  context "when expense is updated" do
    before do
      create(:expense, budget:, amount: 100, expense_category:)
    end

    context "when the new amount is less than the old amount" do
      let(:params) { { credit: 50, debit: 100 } }

      it_behaves_like "Budgets::UpdateTotalExpenses updates the budget total expenses", 50
    end

    context "when the new amount is greater than the old amount" do
      let(:params) { { credit: 150, debit: 100 } }

      it_behaves_like "Budgets::UpdateTotalExpenses updates the budget total expenses", 150
    end
  end

  context "when expense is deleted" do
    before do
      create(:expense, budget:, amount: 100, expense_category:)
    end

    let(:params) { { credit: 0, debit: 100 } }

    it_behaves_like "Budgets::UpdateTotalExpenses updates the budget total expenses", 0
  end
end
