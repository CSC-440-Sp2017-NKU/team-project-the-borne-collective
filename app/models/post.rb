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
   

end
