Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :users do
    get 'dashboard', on: :member
  end

  get 'dashboard', to: 'pages#dashboard'
  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :transactions, only: [:create]
  end
  resources :users, only: [:show, :edit, :update, :create, :new]
  resources :transactions, only: [:show]
  # Defines the root path route ("/")
  # root "posts#index"
end
