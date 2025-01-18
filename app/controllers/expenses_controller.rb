class ExpensesController < ApplicationController
  before_action :budget

  def new
    @expense = Expense.new
  end

  def edit
  end

  def create
    @expense = budget.expenses.new(expense_params)
    if @expense.save
      redirect_to budget_path(budget.uid), notice: "Expense created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def budget
    @budget ||= Budget.find_by(uid: params[:budget_uid])
  end

  def expense_params
    params.require(:expense).permit(:description, :amount, :expense_category_id)
  end
end
