Rails.application.routes.draw do

  devise_for :users,
  controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
  },
    path: "/",
    path_names: { sign_in: 'login',
                  sign_out: 'logout'
                  },
    :skip => 'registration'

  devise_scope :user do
    authenticated :user do
      root to: 'user_dashboard#index',  as: :authenticated_user_root
      resources :users, except: :show
      resources :account_banks
      resources :agency_banks

      get '/transaction' => 'transaction#index'

      #DEPOSITO
      get '/deposit' => 'transaction#deposit'
      post '/deposit' => 'transaction#send_deposit'
      #SAQUE
      get '/withdrawal' => 'transaction#withdrawal'
      post '/withdrawal' => 'transaction#send_withdrawal'
      #Money transfer
      get '/money_transfer' => 'transaction#money_transfer'
      post '/money_transfer' => 'transaction#send_money_transfer'


      patch 'cash_back/:transaction_id' => 'transaction#cash_back', as: :cash_back

    end
    unauthenticated :users do
      root to: "users/sessions#new", as: :unauthenticated_user_root
    end
  end

end
