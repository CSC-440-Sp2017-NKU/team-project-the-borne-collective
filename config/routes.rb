Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'
  
  resources :users
  resources :forums
  resources :replies
  resources :posts
  get 'home/index'

  root 'home#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
