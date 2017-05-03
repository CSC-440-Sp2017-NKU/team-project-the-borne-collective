class Post < ApplicationRecord
    searchable do
      text :title, :default_boost => 2
      text :content
    end
    has_many :replies, :dependent => :destroy
    has_many :votes, :dependent => :destroy
    belongs_to :course
    belongs_to :user


    acts_as_votable
    validates :title,   presence: true, length:  { minimum: 6, maximum: 150 }
    validates :content, presence: true, length:  { minimum: 8 }
    validates :course_id, presence: true
   

end
