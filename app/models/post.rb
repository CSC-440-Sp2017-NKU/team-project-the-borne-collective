class Post < ApplicationRecord
    has_many :replies, :dependent => :destroy
    belongs_to :course
    belongs_to :user
    validates :title,   presence: true, length:  { minimum: 6, maximum: 150 }
    validates :content, presence: true, length:  { minimum: 8 }
    
end
