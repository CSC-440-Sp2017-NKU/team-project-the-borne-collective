class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
 # before_action :registrar_or_admin, only: :new
  
  def new
    @user = User.new
    #@admin = current_user.admin?
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    # Allows admin to set admin/registrar flags
    @user = current_user.admin? ? User.new(user_params_admin) : User.new(user_params)

    if @user.save
      flash[:success] = "User created successfully!"
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def edit
      
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  
  private
  
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def user_params_admin
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :registrar)
    end
    
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_url) unless  current_user.role == admin
    end
    
    def registrar_or_admin(user)
      user.admin || user.registrar
    end
    
end
