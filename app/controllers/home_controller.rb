class HomeController < ApplicationController
    before_action :logged_in_user, only: [:search]
  # [todo] Dynamically pass top Post based on rating when implemented
  def index
    @posts = Post.all
    @courses = Course.all
  end
  
  def search
    query = Post.search do
        fulltext params[:q]
    end
    @results = query.results
  end
  
  private
  
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    
end
