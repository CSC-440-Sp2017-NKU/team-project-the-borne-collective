class Post < ApplicationRecord
    extend Textacular
    has_many :replies, :dependent => :destroy
    has_many :votes, :dependent => :destroy
    belongs_to :course
    belongs_to :user
    

    acts_as_votable
    validates :title,   presence: true, length:  { minimum: 6, maximum: 150 }
    validates :content, presence: true, length:  { minimum: 8 }
    validates :course_id, presence: true
    
    def self.recent_posts
        Post.where("created_at >= ?", 1.week.ago.utc).order("votes_count DESC, created_at DESC")
    end

end
