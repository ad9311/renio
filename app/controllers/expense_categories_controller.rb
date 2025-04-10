# frozen_string_literal: true

class ExpenseCategoriesController < ApplicationController
  before_action :require_admin
  before_action :expense_category, only: %i[show edit update]

  def index
    @expense_categories = ExpenseCategory.order(:name)
  end

  def show; end

  def new
    @expense_category = ExpenseCategory.new
  end

  def edit; end

  def create
    @expense_category = ExpenseCategory.new(expense_category_params)
    if @expense_category.save
      redirect_to expense_categories_path, notice: 'Expense category created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @expense_category.update(expense_category_params)
      redirect_to expense_categories_path, notice: 'Expense category updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def expense_category_params
    params.expect(expense_category: %i[name uid])
  end

  def expense_category
    @expense_category ||= ExpenseCategory.find(params[:id])
  end
end
