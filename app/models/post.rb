class Post < ApplicationRecord
    has_many :replies, :dependent => :destroy
    belongs_to :forum
    validates :title,   presence: true, length:  { minimum: 6, maximum: 150 }
    validates :content, presence: true, length:  { minimum: 8 }
end
