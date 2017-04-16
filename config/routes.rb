Rails.application.routes.draw do
<<<<<<< HEAD
  
  get    '/signup',   to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
=======
  get 'sessions/new'

  get 'users/new'
>>>>>>> 6c1e3d86a85f4be286fe5f85dda6d69d39499410
  
  resources :users
  resources :forums
  resources :replies
  resources :posts
  get 'home/index'

  root 'home#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
