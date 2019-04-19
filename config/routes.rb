Rails.application.routes.draw do

  root 'sessions#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :destinations
  resources :guides
  resources :ratings
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
