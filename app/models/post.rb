class Post < ApplicationRecord
    has_many :replies, :dependent => :destroy
    has_many :votes, :dependent => :destroy
    belongs_to :course
    belongs_to :user
    acts_as_votable
    validates :title,   presence: true, length:  { minimum: 6, maximum: 150 }
    validates :content, presence: true, length:  { minimum: 8 }
   
   def upvote 
     @post = Post.find(params[:id])
     @post.upvote_by current_user
     redirect_to :back
   end
   
   def downvote
     @post = Post.find(params[:id])
     @post.downvote current_user
     redirect_to :back
   end
end
