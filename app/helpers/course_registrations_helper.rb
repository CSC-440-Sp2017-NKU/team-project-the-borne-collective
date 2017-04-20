module CourseRegistrationsHelper
    # Returns [button_value, button_type]
    def get_button_attrs(userID, courseID)
        record = CourseRecord.find_by(:user_id => userID, :course_id => courseID)
        if record != nil
           case record.status
           when 'enrolled'
             return ["Enrolled: (update)", "btn btn-primary"]  
           
           when "completed"
             return ["Completed: (update)", "btn btn-success"] 
           
           when "teaching"
             return ["Teaching: (update)", "btn btn-info"]    
           
           when "taught"
             return ["Taught: (update)", "btn btn-info"]  
           else
              return ["Assign association", "btn btn-secondary"]  
           end
        else
          return ["Assign association", "btn btn-secondary"]
        end
         
    end
end
