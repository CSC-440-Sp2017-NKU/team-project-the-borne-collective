class CourseRecord < ApplicationRecord
   
    belongs_to :course
    belongs_to :user
    enum status: [:enrolled, :completed, :teaching, :taught]
     
    validates :status, presence: true
    validates_uniqueness_of :user_id, :scope => [:course_id]

    
end
