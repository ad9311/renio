Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: redirect("/dashboard")

  devise_for :users

  get "dashboard", to: "dashboards#index", as: :dashboard

  resources :budgets, param: :uid, except: %i[new destroy] do
    resources :expenses, except: :index
  end

  resources :account_receivables do
    resources :receivables, except: :index
    resources :payments, except: :index
  end
end
