Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "dashboards#index"

  devise_for :users

  get "dashboard", to: "dashboards#index", as: :dashboard

  resources :budgets, param: :uid, except: %i[new destroy] do
    resources :expenses, except: :index
  end

  resources :account_receivables
end
