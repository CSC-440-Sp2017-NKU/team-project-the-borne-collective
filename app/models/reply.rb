class Reply < ApplicationRecord
    belongs_to :post
    validates :content, presence: true, length:  { minimum: 8 }
    validates :post_id, presence: true
end
