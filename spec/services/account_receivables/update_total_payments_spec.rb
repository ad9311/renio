# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'AccountReceivables::UpdateTotalPayments updates the total payments' do |amount|
  it 'has the correct total payments' do
    call
    expect(account_receivable.total_payments).to eq(amount)
  end
end

RSpec.describe AccountReceivables::UpdateTotalPayments do
  subject(:call) { described_class.call(account_receivable:, params:) }

  let(:account_receivable) { create(:account_receivable, total_receivables: 1000) }

  context 'when the result is successful' do
    let(:params) { {credit: 100, debit: 0} }

    it 'returns a successful result' do
      expect(call).to be_success
    end
  end

  context 'when the result is not successful' do
    before do
      allow(account_receivable).to receive(:update).and_return(false)
    end

    let(:params) { {credit: 0, debit: 0} }

    it 'returns a failed result' do
      expect(call).not_to be_success
    end
  end

  context 'when a payment is created' do
    let(:params) { {credit: 100, debit: 0} }

    it_behaves_like 'AccountReceivables::UpdateTotalPayments updates the total payments', 100
  end

  context 'when a payment is updated' do
    before do
      create(:payment, account_receivable:, amount: 100)
    end

    context 'when the new amount is less than the old amount' do
      let(:params) { {credit: 50, debit: 100} }

      it_behaves_like 'AccountReceivables::UpdateTotalPayments updates the total payments', 50
    end

    context 'when the new amount is greater than the old amount' do
      let(:params) { {credit: 150, debit: 100} }

      it_behaves_like 'AccountReceivables::UpdateTotalPayments updates the total payments', 150
    end
  end

  context 'when receivabke is deleted' do
    before do
      create(:payment, account_receivable:, amount: 100)
    end

    let(:params) { {credit: 0, debit: 100} }

    it_behaves_like 'AccountReceivables::UpdateTotalPayments updates the total payments', 0
  end
end
