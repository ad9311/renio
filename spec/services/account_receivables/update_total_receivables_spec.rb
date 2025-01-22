require "rails_helper"

RSpec.shared_examples "AccountReceivables::UpdateTotalReceivables updates the total receivables" do |amount|
  it "has the correct total receivables" do
    call
    expect(account_receivable.total_receivables).to eq(amount)
  end
end

RSpec.describe AccountReceivables::UpdateTotalReceivables do
  subject(:call) { described_class.call(account_receivable:, params:) }

  let(:account_receivable) { create(:account_receivable) }

  context "when the result is successful" do
    let(:params) { { credit: 100, debit: 0 } }
    it "returns a successful result" do
      expect(call.success?).to be_truthy
    end
  end

  context "when the result is not successful" do
    before do
      allow(account_receivable).to receive(:update).and_return(false)
    end

    let(:params) { { credit: 0, debit: 0 } }

    it "returns a failed result" do
      expect(call.success?).to be_falsey
    end
  end

  context "when a receivable is created" do
    let(:params) { { credit: 100, debit: 0 } }

    it_behaves_like "AccountReceivables::UpdateTotalReceivables updates the total receivables", 100
  end

  context "when a receivable is updated" do
    before do
      create(:receivable, account_receivable:, amount: 100)
    end

    context "when the new amount is less than the old amount" do
      let(:params) { { credit: 50, debit: 100 } }

      it_behaves_like "AccountReceivables::UpdateTotalReceivables updates the total receivables", 50
    end

    context "when the new amount is greater than the old amount" do
      let(:params) { { credit: 150, debit: 100 } }

      it_behaves_like "AccountReceivables::UpdateTotalReceivables updates the total receivables", 150
    end
  end

  context "when receivabke is deleted" do
    before do
      create(:receivable, account_receivable:, amount: 100)
    end

    let(:params) { { credit: 0, debit: 100 } }

    it_behaves_like "AccountReceivables::UpdateTotalReceivables updates the total receivables", 0
  end
end
