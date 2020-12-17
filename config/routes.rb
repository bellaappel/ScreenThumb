Rails.application.routes.draw do
  root 'application#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, except: [:index]
  resources :plants
  resources :sessions, only: [:create]
  get '/login', to: 'users#login', as: 'login'
  post '/login', to: 'users#create_session'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: 'users#signup', as: 'new'
 
end
