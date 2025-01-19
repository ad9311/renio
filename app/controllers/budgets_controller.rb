class BudgetsController < ApplicationController
  before_action :budget, only: %i[show edit update]

  def index
    @budgets = current_user.budgets.order(created_at: :desc).limit(12)
  end

  def show
    @expenses = budget.expenses.includes(:expense_category).order(created_at: :desc)
  end

  def edit; end

  def update
    if budget.update(budget_params)
      redirect_to budget_path(budget.uid), notice: "Budget updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def budget
    @budget ||= Budget.find_by(uid: params[:uid])
  end

  def budget_params
    params.require(:budget).permit(:amount)
  end
end
