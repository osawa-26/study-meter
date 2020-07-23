Rails.application.routes.draw do
  config = Rails.application.config.study_meter

  constraints host: config[:user][:host] do
    namespace :user, path: config[:user][:path] do
      root "toppages#index"
      get "login" => "sessions#new", as: :login
      # delete "records" => "records#destroy"

      resource :session, only: [ :create, :destroy ]
      resource :account, except: [ :new, :create, :destroy ]
      resource :password, only: [ :show, :edit, :update ]
      resources :records
    end
  end

  constraints host: config[:admin][:host] do
    namespace :admin, path: config[:admin][:path] do
      root "top#index"
      get "login" => "sessions#new", as: :login
      resource :session, only: [ :create, :destroy ]
      resources :app_users do
        resources :records
      end
      resources :records
    end
  end
end
