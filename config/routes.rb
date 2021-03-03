Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.
  resources :products do
    resources :farmer_products, only: [:new, :show, :create]
  end
  resources :buyer_preferences, only: [:new, :create]
  get "profile", to: "users#profile"
end
