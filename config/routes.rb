Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.
    resources :farmer_products, only: [:new, :show, :create]
    get "profile", to: "users#profile"

    resources :buyer_preferences, only: [:new, :create]
    get "profile", to: "users#profile"

    get "dashboards", to: "dashboards#show"
    resources :farmer_transactions, only: [:new, :create, :show] do
      resources :transaction_products, only: [:create]
    end
end
