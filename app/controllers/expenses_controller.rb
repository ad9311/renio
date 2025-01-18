class ExpensesController < ApplicationController
  before_action :budget

  def new
    @expense = Expense.new
  end

  def edit
  end

  def create
  end

  private

  def budget
    @budget ||= Budget.find_by(uid: params[:budget_uid])
  end
end
