Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.
    resources :farmer_products, only: [:new, :show, :create]
    get "profile", to: "users#profile"

  resources :transaction, only: [:new, :show, :create]
end
