module BreadcrumbsHelper
  def breadcrumbs
    [{ name: 'Home', path: dashboard_path }]
  end

  def breadcrumbs_for(controller, action)
    case controller
    when :budgets
      breadcrumbs.concat breadcrumbs_for_budgets(action)
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
    when :new
      [{ name: 'New budget' }]
    when :edit
      [{ name: 'Edit budget' }]
    else
      []
    end
  end
end
