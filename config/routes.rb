Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [:show, :edit, :update, :create, :new] do
    get 'dashboard', on: :member
  end

  get 'dashboard', to: 'pages#dashboard'

  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    delete 'delete', on: :member
    resources :transactions, only: [:create]
  end

  resources :transactions, only: [:show]
end
