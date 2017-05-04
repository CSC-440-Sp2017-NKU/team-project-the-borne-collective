module CourseRegistrationsHelper
    # Returns [button_value, button_type]
    def get_button_attrs(userID, courseID)
        record = CourseRecord.find_by(:user_id => userID, :course_id => courseID)
        if record != nil
           case record.status
           when 'enrolled'
             return ["Enrolled: (update)", "btn btn-primary", true]  
           
           when "completed"
             return ["Completed: (update)", "btn btn-success", true] 
           
           when "teaching"
             return ["Teaching: (update)", "btn btn-info", true]    
           
           when "taught"
             return ["Taught: (update)", "btn btn-info", true]  
           else
              return ["Assign association", "btn btn-secondary", false]  
           end
        else
          return ["Assign association", "btn btn-secondary", false]
        end
         
    end
end
