class Reply < ApplicationRecord
    extend Textacular
    belongs_to :post
    belongs_to :user
    has_many :votes
    default_scope -> { order(created_at: :desc) }
    acts_as_votable
    validates :content, presence: true, length:  { minimum: 8 }
    validates :post_id, presence: true
    validates :user_id, presence: true
end
