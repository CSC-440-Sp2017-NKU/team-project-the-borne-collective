class Reply < ApplicationRecord
    belongs_to :post
    belongs_to :user
    has_many :votes
    searchable do
      text :content
    end

    acts_as_votable
    validates :content, presence: true, length:  { minimum: 8 }
    validates :post_id, presence: true
    validates :user_id, presence: true
    

end
