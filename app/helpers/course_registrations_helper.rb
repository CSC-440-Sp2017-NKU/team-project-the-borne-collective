module CourseRegistrationsHelper
    
    def set_button(userID, courseID)
        record = CourseRecord.find_by(:user_id => userID, :course_id => courseID)
        if record != nil
           if record.enrolled?
             return ["enrolled", "primary"]  
           elsif record.completed?
             return ["completed", "success"] 
           elsif record.teaching?
             return ["teaching", "info"]    
           elsif record.has_taught
             return ["has_taught", "info"]  
           else
             return ["", ""]
           end
        else
          return ["", ""]
        end
         
    end
end
