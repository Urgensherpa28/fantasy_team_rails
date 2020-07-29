Rails.application.routes.draw do
  resources :leagues
  resources :players
  resources :fantasy_players
  resources :fantasy_teams
  # resources :users
  resources :teams
  get '/users/', to: 'users#index'
  get '/users/stay_logged_in', to: 'users#stay_logged_in'
  get '/users/:id', to: 'users#show'
  patch '/users/:id', to: 'users#update'
  post '/users/login', to: 'users#login'
  post '/users', to: 'users#create'
  delete '/users/:id', to: 'users#destroy' 


   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
