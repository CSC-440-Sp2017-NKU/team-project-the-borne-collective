class Course < ApplicationRecord
    has_many :posts, :dependent => :destroy
end
