class Course < ApplicationRecord
    has_many :posts, :dependent => :destroy
    has_many :course_records
    has_many :users, :through => :course_records
end
