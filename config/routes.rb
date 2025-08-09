Rails.application.routes.draw do
  resources :invoices
  resources :products
  resources :invites
  resources :houses
  resources :users

  get "up" => "rails/health#show", as: :rails_health_check

  post "auth/login", to: "auth#login"
end
