Rails.application.routes.draw do
  root "projects#index"

  resources :projects do
    resources :comments, only: [ :create ]
    resources :status_changes, only: [ :create ]
  end

  get "signup", to: "users#new"
  resources :users, except: [ :new ]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
