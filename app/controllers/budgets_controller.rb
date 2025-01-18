class BudgetsController < ApplicationController
  before_action :budget, only: %i[show edit update]

  def index; end

  def show; end

  def edit; end

  def update
    result = Budgets::Edit.call(budget:, params: budget_params)

    if result.success?
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
