# frozen_string_literal: true

module BreadcrumbsHelper
  def breadcrumbs
    [{name: 'Home', path: dashboard_path}]
  end

  def breadcrumbs_for(controller, action)
    case controller
    when :budgets
      breadcrumbs.concat breadcrumbs_for_budgets(action)
    when :account_receivables
      breadcrumbs.concat breadcrumbs_for_account_receivables(action)
    when :receivables
      breadcrumbs.concat breadcrumbs_for_receivables(action)
    when :payments
      breadcrumbs.concat breadcrumbs_for_payments(action)
    when :expenses
      breadcrumbs.concat breadcrumbs_for_expenses(action)
    when :todos
      breadcrumbs.concat breadcrumbs_for_todos(action)
    else
      breadcrumbs
    end
  end

  private

  def breadcrumbs_for_budgets(action)
    case action
    when :index
      [{name: 'Budgets'}]
    when :show
      [{name: 'Budget'}]
    when :edit
      [{name: 'Budget', path: budget_path(@budget)}, {name: 'Edit'}]
    else
      []
    end
  end

  def breadcrumbs_for_expenses(action)
    budget = {name: 'Budget', path: budget_path(@budget)}

    case action
    when :new
      [budget, {name: 'New expense'}]
    when :show
      [budget, {name: 'Expense'}]
    when :edit
      expense = {name: 'Expense', path: budget_expense_path(@budget, @expense)}
      [budget, expense, {name: 'Edit'}]
    else
      []
    end
  end

  def breadcrumbs_for_account_receivables(action)
    case action
    when :index
      [{name: 'Account receivables'}]
    when :show
      [{name: 'Account receivable'}]
    when :new
      [{name: 'Account Receivables', path: account_receivables_path}, {name: 'New'}]
    when :edit
      show_path = {name: 'Account receivable', path: account_receivable_path(@account_receivable)}
      [show_path, {name: 'Edit'}]
    else
      []
    end
  end

  def breadcrumbs_for_receivables(action)
    account_receivable = {name: 'Account receivable', path: account_receivable_path(@account_receivable)}

    case action
    when :new
      [account_receivable, {name: 'New receivable'}]
    when :show
      [account_receivable, {name: 'Receivable'}]
    when :edit
      receivable = {name: 'Receivable', path: account_receivable_receivable_path(@account_receivable, @receivable)}
      [account_receivable, receivable, {name: 'Edit'}]
    else
      []
    end
  end

  def breadcrumbs_for_payments(action)
    account_receivable = {name: 'Account receivable', path: account_receivable_path(@account_receivable)}

    case action
    when :new
      [account_receivable, {name: 'New payment'}]
    when :show
      [account_receivable, {name: 'Payment'}]
    when :edit
      payment = {name: 'Payment', path: account_receivable_payment_path(@account_receivable, @payment)}
      [account_receivable, payment, {name: 'Edit'}]
    else
      []
    end
  end

  def breadcrumbs_for_todos(action)
    case action
    when :index
      [{name: 'Todos'}]
    when :show
      [{name: 'Todo'}]
    when :new
      [{name: 'Todos', path: todos_path}, {name: 'New'}]
    when :edit
      show_path = {name: 'Todo', path: todo_path(@todo)}
      [show_path, {name: 'Edit'}]
    else
      []
    end
  end
end
