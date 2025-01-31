module BreadcrumbsHelper
  def breadcrumbs
    [{ name: 'Home', path: dashboard_path }]
  end

  def breadcrumbs_for(controller, action)
    case controller
    when :budgets
      breadcrumbs.concat breadcrumbs_for_budgets(action)
    when :account_receivables
      breadcrumbs.concat breadcrumbs_for_account_receivables(action)
    else
      breadcrumbs
    end
  end

  private

  def breadcrumbs_for_budgets(action)
    case action
    when :index
      [{ name: 'Budgets' }]
    when :show
      [{ name: 'Budget' }]
    when :edit
      [{ name: 'Budget', path: budget_path(@budget) }, { name: 'Edit' }]
    else
      []
    end
  end

  def breadcrumbs_for_account_receivables(action)
    case action
    when :index
      [{ name: 'Account receivables' }]
    when :show
      [{ name: 'Account receivable' }]
    when :new
      [{ name: 'Account Receivables', path: account_receivables_path }, { name: 'New' }]
    when :edit
      show_path = { name: 'Account receivable', path: account_receivable_path(@account_receivable) }
      [show_path, { name: 'Edit' }]
    else
      []
    end
  end
end
