class BudgetsController < ApplicationController
  before_action :budget, only: %i[show edit update]
  before_action :wallet, only: :index

  def index
    @budgets = wallet.budgets.order(created_at: :desc).limit(12)
  end

  def show
    @expenses = budget.expenses.includes(:expense_category).order(created_at: :desc)
  end

  def edit; end

  def update
    if budget.update(budget_params)
      redirect_to budget_path(budget.uid), notice: 'Budget updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def next
    flash = {}
    result = Budgets::CreateNext.call(wallet:)

    if result.success?
      flash[:notice] = 'Budget created successfully'
    else
      flash[:alert] = "Error creating budget: #{result.errors.join(', ')}"
    end

    redirect_to(budget_path(result.budget), **flash)
  end

  private

  def budget
    @budget ||= Budget.find_by(uid: params[:uid])
  end

  def budget_params
    params.require(:budget).permit(:amount)
  end

  def wallet
    @wallet ||= current_user.wallet
  end
end
