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
    if @course_record.update_attributes(param_status)
      flash[:danger] = "Error: You must select a proper enrollment type!"
    
    elsif @user.course_records.find_by(course_id: param_course_id).status != nil
      course_record_exist = @user.course_records.find_by(course_id: param_course_id)
      course_record_exist.update_attributes(update_params)
      flash[:success] = "Courses registered successfully!"
    else
      @course_record = CourseRecord.new
      @course_record.user_id = @user.id
      @course_record.update_attributes(update_params)
      flash[:success] = "Courses registered successfully!"
      @course_record.save 
    end 
    
    @user = User.find(params[:id])
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

    
    def update_params
      params.require(:course_record).permit(:course_id, :status)
    end
    
    def param_course_id
      params.permit(:course_id)
    end
    
    def param_status
      params.require(:course_record).permit(status: Parameter.enum("enrolled", "has_taught"))
    end
end
