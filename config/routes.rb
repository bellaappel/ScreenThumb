Rails.application.routes.draw do
  root 'application#home'
  get '/', to: "application#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/plant-with-most-comments', to: 'plants#most_comments', as: 'most_commented_plant'
  resources :users, except: [:index]
  
  resources :comments
  resources :plants do 
    resources :comments, only: [:index, :new]
  end
  resources :orders, only: [:index, :show] do
    resources :plants, only: [:index, :show]
  end

  resources :sessions, only: [:create]
  get '/login', to: 'users#login', as: 'login'
  post '/login', to: 'users#create_session'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: 'users#signup', as: 'new'
  get '/auth/facebook/callback', to: 'sessions#facebook_create', as: 'facebook_login'
 
  

 
end
