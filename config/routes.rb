Rails.application.routes.draw do

  namespace :user, path: "" do
    root "toppages#index"
    get "login" => "sessions#new", as: :login
    resource :session, only: [ :create, :destroy ]
    resource :account, except: [ :new, :create, :destroy ]
    resource :password, only: [ :show, :edit, :update ]
    resources :records
  end

  namespace :admin do
    root "top#index"
    get "login" => "sessions#new", as: :login
    resource :session, only: [ :create, :destroy ]
    resources :app_users do
      resources :records
    end
    resources :records
  end
end
