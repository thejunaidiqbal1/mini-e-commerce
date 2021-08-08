Rails.application.routes.draw do

  root to: "home#index"
  # devise_for :users
  # devise_for :customers
  devise_for :users, :controllers => {
    :registrations => "users/registrations",
    :sessions => "users/sessions",
    :passwords => "users/passwords",
    :confirmations => "users/confirmations"
  }

  devise_for :customers, :controllers => {
    :registrations => "customers/registrations",
    :sessions => "customers/sessions",
    :passwords => "customers/passwords",
    :confirmations => "customers/confirmations"
  }

  devise_scope :user do
    authenticated :user do
      namespace :users do
        get 'users/sessions', as: :authenticated_root
      end
    end
  end

  devise_scope :customer do
    authenticated :customer do
      namespace :customers do
        get 'customers/sessions', as: :authenticated_root
      end
    end
  end

  resources :companies
  get "companies-list", to: "companies#list"
  get "employees", to: "companies#employee"

  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
