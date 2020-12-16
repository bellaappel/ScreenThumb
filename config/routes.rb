Rails.application.routes.draw do
  root 'application#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :plants
  resources :sessions, only: [:create]
  get '/login', to: 'sessions#login', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
end
