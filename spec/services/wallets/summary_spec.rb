# frozen_string_literal: true

require 'rails_helper'

describe Wallets::Summary, type: :service do
  subject(:call) { described_class.call(user:) }

  let(:user) { create(:user) }
  let(:wallet) { create(:wallet, user:) }
  let(:month) { Time.zone.now.month }
  let(:year) { Time.zone.now.year }

  before do
    wallet
  end

  context 'when there is a current budget' do
    before { create(:budget, wallet:) }

    it 'returns the current budget' do
      expect(call.summary[:current_budget]).to eq(wallet.budgets.where(month:, year:).first)
    end
  end

  context 'when there is no current budget' do
    it 'creates a new budget' do
      expect { call }.to change { wallet.budgets.count }.by(1)
    end
  end

  context 'when there is no last expense' do
    it 'returns nil' do
      expect(call.summary[:last_expense]).to be_nil
    end
  end

  context 'when there is a last expense' do
    before do
      create(:budget, wallet:, amount: 100)
      create(:expense_category, name: 'Test', uid: 'test')
      create(:expense, budget: wallet.budgets.where(month:, year:).first, expense_category: ExpenseCategory.last)
    end

    it 'returns the last expense' do
      expect(call.summary[:last_expense]).to eq(Expense.last)
    end
  end

  context 'when there is an account receivable' do
    before { create(:account_receivable, wallet:) }

    it 'returns the account receivable' do
      expect(call.summary[:last_account_receivable]).to eq(AccountReceivable.last)
    end
  end

  context 'when there is no account receivable' do
    it 'returns nil' do
      expect(call.summary[:last_account_receivable]).to be_nil
    end
  end

  context 'when the budget is not created' do
    let(:budget) { Budget.new }

    it 'raises an error' do
      allow(Budget).to receive(:create).and_return(budget)
      allow(budget).to receive(:persisted?).and_return(false)
      expect { call }.to raise_error(RuntimeError, 'Failed to create budget')
    end
  end
end
