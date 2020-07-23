Rails.application.routes.draw do
  config = Rails.application.config.study_meter

  constraints host: "3.90.238.250" do
    namespace :user, path: "" do
      root "toppages#index"
      get "login" => "sessions#new", as: :login
      # delete "records" => "records#destroy"

      resource :session, only: [ :create, :destroy ]
      resource :account, except: [ :new, :create, :destroy ]
      resource :password, only: [ :show, :edit, :update ]
      resources :records
    end
  end

  constraints host: "3.90.238.250" do
    namespace :admin, path: "admin" do
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
