# frozen_string_literal: true

class ExpensesController < ApplicationController
  before_action :budget
  before_action :expense, except: %i[new create]

  def show; end

  def new
    @expense = Expense.new
  end

  def edit; end

  def create
    redirect_to budget_path(@budget), alert: 'Budget needs to have an amount' if @budget.amount.zero?

    @expense = budget.expenses.new(expense_params)
    if @expense.save
      redirect_to new_budget_expense_path(budget), notice: 'Expense created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @expense.update(expense_params)
      redirect_to budget_expense_path(budget, @expense), notice: 'Expense updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @expense.destroy!
    redirect_to new_budget_expense_path(budget), notice: 'Expense deleted successfully'
  end

  private

  def budget
    @budget ||= Budget.find_by(uid: params[:budget_uid])
  end

  def expense
    @expense ||= budget.expenses.find(params[:id])
  end

  def expense_params
    params.expect(expense: %i[description amount expense_category_id])
  end
end
