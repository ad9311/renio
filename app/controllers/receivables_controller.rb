class ReceivablesController < ApplicationController
  before_action :account_receivable
  before_action :account_receivable_not_canceled
  before_action :receivable, except: %i[new create]


  def show; end

  def new
    @receivable = Receivable.new
  end

  def edit; end

  def create
    @receivable = account_receivable.receivables.new(receivable_params)
    if @receivable.save
      redirect_to account_receivable_path(account_receivable), notice: "Receivable created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @receivable.update(receivable_params)
      redirect_to account_receivable_path(account_receivable), notice: "Receivable updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @receivable.destroy!

    redirect_to account_receivable_path(account_receivable), notice: "Receivable deleted successfully"
  end

  private

  def account_receivable
    @account_receivable ||= AccountReceivable.find_by(id: params[:account_receivable_id])
  end

  def account_receivable_not_canceled
    redirect_to(
      account_receivable_path(account_receivable),
      alert: "Account receivable is canceled"
    ) if account_receivable.canceled?
  end

  def receivable
    @receivable ||= Receivable.find_by(id: params[:id])
  end

  def receivable_params
    params.require(:receivable).permit(:description, :amount)
  end
end
