# frozen_string_literal: true

class AccountReceivablesController < ApplicationController
  before_action :wallet, only: :index
  before_action :account_receivable, except: %i[index new create]
  before_action :redirect_if_canceled, only: :update

  def index
    @account_receivables = wallet.account_receivables.order(created_at: :desc)
  end

  def show
    @receivables = account_receivable.receivables.order(created_at: :desc)
    @payments = account_receivable.payments.order(created_at: :desc)
  end

  def new
    @account_receivable = AccountReceivable.new
  end

  def edit; end

  def create
    account_receivable = wallet.account_receivables.new(account_receivable_params)
    if account_receivable.save
      redirect_to account_receivables_path, notice: 'Account receivable created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if account_receivable.update(account_receivable_params)
      redirect_to account_receivables_path, notice: 'Account receivable updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    account_receivable.destroy!
    redirect_to account_receivables_path, notice: 'Account receivable deleted successfully'
  end

  def update_status
    result = AccountReceivables::UpdateStatus.call(account_receivable:)

    redirect_to account_receivable_path(account_receivable), notice: result.message
  end

  private

  def account_receivable
    @account_receivable ||= AccountReceivable.find_by(id: params[:id])
  end

  def account_receivable_params
    params.expect(account_receivable: [:debtor])
  end

  def wallet
    @wallet ||= current_user.wallet
  end

  def redirect_if_canceled
    path = account_receivable_path(account_receivable)
    alert = 'This account receivable is canceled'

    redirect_to(path, alert:) and return if account_receivable.canceled?
  end
end
