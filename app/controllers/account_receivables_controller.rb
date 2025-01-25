class AccountReceivablesController < ApplicationController
  before_action :wallet, only: :index
  before_action :account_receivable, except: %i[index new create]

  def index
    @account_receivables = wallet.account_receivables.order(created_at: :desc)
  end

  def show
    @receivables = account_receivable.receivables.order(created_at: :desc)
  end

  def new
    @account_receivable = AccountReceivable.new
  end

  def edit; end

  def create
    @account_receivable = wallet.account_receivables.new(account_receivable_params)
    if @account_receivable.save
      redirect_to account_receivables_path, notice: "Account receivable created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @account_receivable.update(account_receivable_params)
      redirect_to account_receivables_path, notice: "Account receivable updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @account_receivable.destroy!
    redirect_to account_receivables_path, notice: "Account receivable deleted successfully"
  end

  private

  def account_receivable
    @account_receivable ||= AccountReceivable.find_by(id: params[:id])
  end

  def account_receivable_params
    params.require(:account_receivable).permit(:debtor)
  end

  def wallet
    @wallet ||= current_user.wallet
  end
end
