Rails.application.routes.draw do

  devise_for :users
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'

   root 'guides#index'

   resources :guides do
     resources :ratings, only: [:create]
   end
    resources :users do
      resources :guides, only: [:index]
  end

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
