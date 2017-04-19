class Post < ApplicationRecord
    has_many :replies, :dependent => :destroy
    has_many :votes, :dependent => :destroy
    belongs_to :course
    validates :title,   presence: true, length:  { minimum: 6, maximum: 150 }
    validates :content, presence: true, length:  { minimum: 8 }
    
end
