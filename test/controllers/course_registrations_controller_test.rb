require 'test_helper'

class CourseRegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_registration = course_registrations(:one)
  end

  test "should get index" do
    get course_registrations_url
    assert_response :success
  end

  test "should get new" do
    get new_course_registration_url
    assert_response :success
  end

  test "should create course_registration" do
    assert_difference('CourseRegistration.count') do
      post course_registrations_url, params: { course_registration: {  } }
    end

    assert_redirected_to course_registration_url(CourseRegistration.last)
  end

  test "should show course_registration" do
    get course_registration_url(@course_registration)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_registration_url(@course_registration)
    assert_response :success
  end

  test "should update course_registration" do
    patch course_registration_url(@course_registration), params: { course_registration: {  } }
    assert_redirected_to course_registration_url(@course_registration)
  end

  test "should destroy course_registration" do
    assert_difference('CourseRegistration.count', -1) do
      delete course_registration_url(@course_registration)
    end

    assert_redirected_to course_registrations_url
  end
end
