Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "dashboards#index"

  devise_for :users

  resources :budgets, param: :uid, except: %i[new destroy] do
    resources :expenses, except: :index
  end
end
