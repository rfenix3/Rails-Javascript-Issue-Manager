Rails.application.routes.draw do
  resources :issues
  resources :employees
  resources :supports
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
