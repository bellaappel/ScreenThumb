Rails.application.routes.draw do
  root 'application#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/plant-with-most-comments', to: 'plants#most_comments', as: 'most_commented_plant'

  resources :users, except: [:index]
  resources :plants
  resources :comments
  resources :orders, only: [:index, :show]
  resources :plants do 
    resources :comments, only: [:show, :new]
  end
  resources :orders do
    resources :plants, only: [:index, :show]
  end

  resources :sessions, only: [:create]
  get '/login', to: 'users#login', as: 'login'
  post '/login', to: 'users#create_session'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: 'users#signup', as: 'new'
 
end
