# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :account_receivable
  before_action :account_receivable_not_canceled
  before_action :payment, except: %i[new create]

  def show; end

  def new
    @payment = Payment.new
  end

  def edit; end

  def create
    @payment = account_receivable.payments.new(payment_params)
    if @payment.save
      redirect_to account_receivable_path(account_receivable), notice: 'Payment created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @payment.update(payment_params)
      redirect_to account_receivable_path(account_receivable), notice: 'Payment updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @payment.destroy!

    redirect_to account_receivable_path(account_receivable), notice: 'Payment deleted successfully'
  end

  private

  def account_receivable
    @account_receivable ||= AccountReceivable.find_by(id: params[:account_receivable_id])
  end

  def account_receivable_not_canceled
    return unless account_receivable.canceled?

    redirect_to(
      account_receivable_path(account_receivable),
      alert: 'Account receivable is canceled',
    )
  end

  def payment
    @payment ||= Payment.find_by(id: params[:id])
  end

  def payment_params
    params.expect(payment: %i[date_received amount])
  end
end
