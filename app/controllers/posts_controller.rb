class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :create, :update, :destroy, :voteUp, :voteDown]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :voteUp, :voteDown]
  before_action :correct_user, only: [:update]

  # GET /posts
  # GET /posts.json

  # GET /posts/1
  # GET /posts/1.json
  def show
    @answers = @post.replies
  end

  # GET /posts/new
  def new
    @post = Post.new
    if params.has_key?(:course)
      @post.course_id = params[:course]
    else 
      redirect_to root_url
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @user = current_user
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = "Post created successfully!"
      redirect_to @post
    else
      flash.now[:danger] = 'Posting Failed'
      render 'new'
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update_attributes(post_params)
      flash[:success] = "Post Updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    flash[:success] = "User deleted"
    redirect_to root_url
  end
  
   def upvote 
     @post = Post.find(params[:id])
     @post.upvote_by current_user
     redirect_to :back
   end
   
  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      x = params.require(:post).permit(:title, :content, :course_id)
      x.merge!(user_id: current_user.id)
      return x
    end
    
    # Ensure correct user is updating their own post (or admin)
    def correct_user
      @post = Post.find(params[:id])
      @user = User.find(@post.user_id)
      redirect_to(root_url) unless ( current_user?(@user) | current_user.admin?)
    end
    
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
