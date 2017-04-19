require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end
  
  test "should get new" do
    log_in_as(@user)
    get new_user_path
    assert_response :success
  end

end
