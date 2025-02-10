# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountReceivables::UpdateStatus do
  subject(:call) { described_class.call(account_receivable:) }

  let(:account_receivable) { create(:account_receivable) }

  context 'when account_receivable is canceled' do
    before { account_receivable.canceled! }

    context 'when the balance is zero' do
      it 'activates the account receivable as paid' do
        call
        expect(account_receivable.status).to eq('paid')
      end
    end

    context 'when the balance is not zero' do
      before { create(:receivable, account_receivable:, amount: 100) }

      it 'activates the account receivable as pending' do
        call
        expect(account_receivable.status).to eq('pending')
      end
    end
  end

  context 'when the account_receivable is not canceled' do
    it 'cancels the account_receivable' do
      call
      expect(account_receivable.status).to eq('canceled')
    end
  end
end
