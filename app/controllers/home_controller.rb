class HomeController < ApplicationController
  
  # [todo] Dynamically pass top Post based on rating when implemented
  def index
    @posts = Post.all
  end
end
