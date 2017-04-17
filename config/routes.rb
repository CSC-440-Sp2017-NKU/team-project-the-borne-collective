Rails.application.routes.draw do
  resources :forums
  resources :replies
  resources :posts
  get 'home/index'
  get  'application/management'

  root 'home#index'
  root 'application#management'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
