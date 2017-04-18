Rails.application.routes.draw do
  
  get    '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :courses
  resources :replies
  resources :posts
  get 'home/index'

  root 'home#index'
  
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
