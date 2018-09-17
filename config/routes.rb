Rails.application.routes.draw do

  root "static_pages#home"
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  resources :users
  resources :issues
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
