# frozen_string_literal: true

class AdminSettingsController < ApplicationController
  before_action :require_admin

  def index
    @settings = [
      {name: 'Expense categories', path: expense_categories_path},
      {name: 'Add new expense category', path: new_expense_category_path},
    ]
  end
end
