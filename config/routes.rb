Rails.application.routes.draw do

  root 'sessions#home'
  get '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :destinations
  resources :guides
  resources :ratings
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
