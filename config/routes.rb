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
      get '/deposit' => 'transaction#deposit'
      post '/deposit' => 'transaction#send_deposit'

    end
    unauthenticated :users do
      root to: "users/sessions#new", as: :unauthenticated_user_root
    end
  end

end
