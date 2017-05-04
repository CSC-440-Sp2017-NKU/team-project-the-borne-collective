class CourseRegistrationsController < ApplicationController
  before_action :admin_or_registrar, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:edit, :update, :destroy]
  

  # GET /course_registrations/1/edit
  def edit
    @courses = Course.all
    @course_record = CourseRecord.new
  end


  # PATCH/PUT /course_registrations/1
  def update
    existing_record = @user.course_records.find_by(user_id: @user.id, course_id: param_course_id)
    # Update existing course record
    if existing_record != nil
      if existing_record.update_attributes(param_status)
        flash[:success] = "Courses registered successfully!"
      else
        flash[:danger] = "Registration Error: check registration status and try again."
      end
      
    # Create new course record  
    else
      new_record = CourseRecord.new(update_params())
      if new_record.save
        flash[:success] = "Courses registered successfully!"
      else
        flash[:danger] = "Registration Error: check registration status and try again."
      end
    end 
    
    @courses = Course.all
    @course_record = CourseRecord.new
    render 'edit'
  end

  # DELETE /course_registrations/1
  def destroy
    record = @user.course_records.find_by(user_id: @user.id, course_id: delete_params[:course_id])
    if record != nil
      record.destroy
      flash[:success] = "Course record removed!"
    else
      flash[:danger] = "Error: course doesn't exist."  
      
    end
    
    @courses = Course.all
    @course_record = CourseRecord.new
    render 'edit'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def update_params()
        x = params.require(:course_record).
            permit(:course_id, :status)
        x.merge!(user_id: @user.id)
        return x
        
    end
    
    def param_course_id
       permitted_params = params.require(:course_record).permit(:course_id)
       return permitted_params[:course_id]
    end
    
    def param_status
      return params.require(:course_record).permit(:status)
    end
    
    def admin_or_registrar
      redirect_to root_url unless current_user.admin? | current_user.registrar?
    end
    
    def delete_params
      params.permit(:course_id)
    end
end
