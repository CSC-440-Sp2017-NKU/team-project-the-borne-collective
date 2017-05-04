class HomeController < ApplicationController
    before_action :logged_in_user, only: [:search]
  # [todo] Dynamically pass top Post based on rating when implemented
  def index
    @posts = Post.where("created_at >= ?", 1.week.ago.utc)
    
    @top_post = Post.where(["created_at >= ?", 1.week.ago.utc ]).order("cached_votes_up DESC, created_at DESC")
    
    
    if logged_in?
      @top_post = Array.new
      
      # Get user's courses id to limit Post
      user_courses = Array.new
      current_user.course_records.each do |record|
        user_courses.push(record[:course_id])
      end
      
      Post.where("created_at >= ?", 1.week.ago.utc).order("cached_votes_up DESC, created_at DESC").each do |post|
        if user_courses.include?(post.course_id)
          @top_post.push(post)
        end
      end
      
      
      
      @active_courses  = Array.new
      @inactive_courses = Array.new
      current_user.course_records.each do |record|
        if (record[:status] == "enrolled") | (record[:status] == "teaching")
          @active_courses.push(Course.find(record[:course_id]))
        else
          @inactive_courses.push(Course.find(record[:course_id]))
        end
      end
    else
      @courses = Course.all
    end
  end
  
  def search
    @results = Post.basic_search(title: params[:q])
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
