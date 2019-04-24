Rails.application.routes.draw do

   root 'static#home'

   resources :guides do
     resources :ratings, only: [:create]
   end
    resources :users, only: [:show] do
      resources :guides, only: [:index]
  end

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
