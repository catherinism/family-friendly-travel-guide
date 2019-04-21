Rails.application.routes.draw do

   root 'static#home'

   resources :guides do
     resources :ratings, only: [:create]
   end
    resources :users, only: [:new, :create, :show] do
      resources :guides, only: [:index]
  end

  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
