class Post < ApplicationRecord
    has_many :Replys, :dependent => :destroy
    validates :title,   presence: true, length:  { minimum: 6, maximum: 150 }
    validates :content, presence: true, length:  { minimum: 8 }
end
