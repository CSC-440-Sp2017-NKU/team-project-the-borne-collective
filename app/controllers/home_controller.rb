class HomeController < ApplicationController
  
  # [todo] Dynamically pass top Post based on rating when implemented
  def index
    @posts = Post.all
    @courses = Course.all
  end
  
  def search
    @query = Post.search do
        fulltext params[:q]
    end
    @products = @query.results
  end
  
end
