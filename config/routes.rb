Rails.application.routes.draw do
  namespace :user do
    root "top#index"
    get "login" => "sessions#new", as: :login
    post "sessions" => "sessions#create", as: :session
    delete "sessions" => "sessions#destroy"
  end

  namespace :admin do
    root "top#index"
    get "login" => "sessions#new", as: :login
    post "sessions" => "sessions#create", as: :session
    delete "sessions" => "sessions#destroy"
  end
end
