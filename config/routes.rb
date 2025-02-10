# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  root to: redirect('/dashboard')

  # Devise
  devise_for :users

  # Dashboard
  get 'dashboard', to: 'dashboards#index', as: :dashboard

  # Budgets
  resources :budgets, param: :uid, except: %i[new destroy] do
    resources :expenses, except: :index
  end
  post 'budgets/:uid/next', to: 'budgets#next', as: :budget_next

  # Accounts receivable
  resources :account_receivables do
    resources :receivables, except: :index
    resources :payments, except: :index
  end

  patch 'account_receivables/:id/update_status', to: 'account_receivables#update_status',
    as: :account_receivable_update_status

  # Todos
  resources :todos
end
