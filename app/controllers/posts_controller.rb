class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
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
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :user_id, :course_id)
    end
    
    # Ensure correct user is updating their own post (or admin)
    def correct_user
      @post = Post.find(params[:id])
      @user = User.find(@post.user_id)
      redirect_to(root_url) unless ( current_user?(@user) | current_user.admin?)
    end
end
