class RepliesController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :create, :update, :upvote, :downvote ]
  before_action :set_reply, only: [:show, :edit, :update, :destroy]

  # GET /replies
  # GET /replies.json
  def index
    @replies = Reply.all
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
  end

  # GET /replies/new
  def new
    @reply = Reply.new
    if params.has_key?(:post)
      @reply.post_id = params[:post]
    else 
      redirect_to root_url
    end
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies
  # POST /replies.json
  def create
    reply = Reply.new(reply_params)

    if reply.save
      flash[:success] = "Reply created successfully!"
      redirect_to post_path(Post.find(reply.post_id))
    else
      flash.now[:danger] = 'Invalid Reply'
      redirect_to "replies/new?post=#{reply_params[:post_id]}"
      #redirect_to "/replies/new?post=#{@reply.post_id}"
      #redirect_to :action => 'new', :post => @reply.post_id
    end
  end

  # PATCH/PUT /replies/1
  # PATCH/PUT /replies/1.json
  def update
    if @reply.update_attributes(update_params)
      flash[:success] = "Reply Updated"
      redirect_to @reply
    else
      render 'edit'
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to replies_url, notice: 'Reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def upvote 
    @reply = Reply.find(params[:id])
    @reply.upvote_by current_user
    redirect_to :back
  end
    
  def downvote 
    @reply = Reply.find(params[:id])
    @reply.downvote_by current_user
    redirect_to :back
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      x = params.require(:reply).permit(:content, :post_id)
      x.merge!(user_id: current_user.id)
      return x
    end
    
    def update_params
      params.require(:reply).permit(:content)
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
