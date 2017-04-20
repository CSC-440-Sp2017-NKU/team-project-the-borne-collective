class Reply < ApplicationRecord
    belongs_to :post
    belongs_to :user
    has_many :votes
    acts_as_votable
    validates :content, presence: true, length:  { minimum: 8 }
    validates :post_id, presence: true, on: :create
    validates :user_id, presence: true, on: :create
    
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
