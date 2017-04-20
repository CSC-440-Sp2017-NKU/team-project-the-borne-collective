Rails.application.routes.draw do
  
  get    '/register', to: 'users#new'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  
  get    '/register_courses/:id/edit',   to: 'course_registrations#edit'
  post   '/register_courses/:id',        to: 'course_registrations#update'
  delete '/register_courses/:id',        to: 'course_registrations#destroy'
  
  
  
  resources :users
  resources :courses
  resources :replies
  resources :posts
  
  resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end
  
  resources :replies do
    member do
      put "like", to: "replies#upvote"
      put "dislike", to: "replies#downvote"
    end
  end

  get 'home/index'
  get  'application/management'

  root 'home#index'
  root 'application#management'
  
#                                - resources :[MODEL] route table -
#------------------------------------------------------------------------------------------
# HTTP 	  request			  URL Action		Named route		       Purpose
#------   --------      ----------    -------------------- --------------------------------
# GET		  /users			  index			    users_path			     page to list all users
# GET		  /users/1		  show			    user_path(user)		   page to show user
# GET		  /users/new		new				    new_user_path		     page to make a new user (signup)
# POST	  /users			  create			  users_path			     create a new user
# GET	   	/users/1/edit	edit			    edit_user_path(user) page to edit user with id 1
# PATCH	  /users/1		  update			  user_path(user)		   update user
# DELETE	/users/1		  destroy			  user_path(user)		   delete user
end
