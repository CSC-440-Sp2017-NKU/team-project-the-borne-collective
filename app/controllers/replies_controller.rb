class RepliesController < ApplicationController
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
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies
  # POST /replies.json
  def create
    @reply = Reply.new(reply_params)

    if @reply.save
      flash[:success] = "Reply created successfully!"
      redirect_to post_path(Post.find(@reply.post_id))
    else
      flash.now[:danger] = 'Invalid Reply'
      render 'new'
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.require(:reply).permit(:content, :post_id, :user_id)
    end
    
    def update_params
      params.require(:reply).permit(:content)
    end
    
  def upvote 
    @reply = Reply.find(params[:id])
    @reply.upvote_by current_user
    redirect_to :back
  end
    
  def upvote 
    @reply = Reply.find(params[:id])
    @reply.downvote_by current_user
    redirect_to :back
  end
  
end
