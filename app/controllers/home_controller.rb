class HomeController < ApplicationController
  
  # [todo] Dynamically pass top Post based on rating when implemented
  def index
    @posts = Post.all
    @courses = Course.all
  end
end
