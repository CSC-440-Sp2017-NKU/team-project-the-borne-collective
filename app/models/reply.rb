class Reply < ApplicationRecord
    belongs_to :post
    belongs_to :user
    has_many :votes
    acts_as_votable
    validates :content, presence: true, length:  { minimum: 8 }
    validates :post_id, presence: true, on: :create
    validates :user_id, presence: true, on: :create
    

end
