class BudgetsController < ApplicationController
  before_action :budget, only: %i[show edit update]

  def index; end

  def show; end

  def edit; end

  def update
  end

  private

  def budget
    @budget ||= Budget.find_by(uid: params[:uid])
  end

  def budget_params
    params.require(:budget).permit(:amount)
  end
end
