Rails.application.routes.draw do

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  resources :users
  resources :resources
  resources :categories

  root to: 'resources#index'
  
  post '/resources/:id/like', to: 'resources#like', as: "like"
  post '/resources/:id/dislike', to: 'resources#dislike', as: "dislike" 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
