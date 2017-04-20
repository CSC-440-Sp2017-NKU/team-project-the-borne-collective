class CourseRegistrationsController < ApplicationController
  #before_action :set_course_registration, only: [:show, :edit, :update, :destroy]

  # GET /course_registrations
  # GET /course_registrations.json
  def index
  end

  # GET /course_registrations/1
  # GET /course_registrations/1.json

  # GET /course_registrations/1/edit
  def edit
    @user = User.find(params[:id])
    @courses = Course.all
    @course_record = CourseRecord.new
  end


  # PATCH/PUT /course_registrations/1
  # PATCH/PUT /course_registrations/1.json
  def update
    @user = User.find(params[:id])
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
        new_record.errors.full_messages
      end
    end 
    
    @courses = Course.all
    @course_record = CourseRecord.new
    render 'edit'
  end

  # DELETE /course_registrations/1
  # DELETE /course_registrations/1.json
  def destroy
    @course_registration.destroy
    respond_to do |format|
      format.html { redirect_to course_registrations_url, notice: 'Course registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_registration
      @course_registration = CourseRegistration.find(params[:id])
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
    
end
