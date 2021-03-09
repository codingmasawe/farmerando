Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.
    resources :farmer_products, only: [:new, :show, :create]
    get "profile", to: "users#profile"

    resources :buyer_preferences, only: [:new, :create, :edit, :update]
    get "profile", to: "users#profile"

    get "dashboards", to: "dashboards#show"

    resources :farmer_transactions, only: [:new, :create, :index, :show] do
      resources :transaction_products, only: [:create]
    end

    get '/confirm/:id', to: 'farmer_transactions#confirm', as: :farmer_transaction_confirmation

    get 'request_for_buyer/:id', to: "farmer_transactions#request_for_buyer"
    get 'reject_transaction/:id', to: "farmer_transactions#reject_transaction", as: :reject_transaction
    get 'accept_transaction/:id', to: "farmer_transactions#accept_transaction", as: :accept_transaction

end

