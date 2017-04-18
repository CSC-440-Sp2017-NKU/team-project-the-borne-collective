require 'test_helper'

class RepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reply = replies(:one)
    @post = posts(:one)
    @user = users(:one)
    @other_user = users(:two)
    @course = courses(:one)
    
    @reply.user_id = @user.id
    @reply.post_id = @post.id
    @post.course_id = @course.id
    @post.user_id = @user.id
  end

  test "should get index" do
    get replies_url
    assert_response :success
  end

  test "should get new" do
    get new_reply_url
    assert_response :success
  end

  test "should create reply" do
    log_in_as(@user)
    assert_difference('Reply.count') do
      post replies_path, params: { reply: { content: @reply.content, post_id: @post.id, user_id: @user.id } }
    end

    assert_redirected_to @post
  end

  test "should show reply" do
    get reply_url(@reply)
    assert_response :success
  end

  test "should get edit" do
    get edit_reply_url(@reply)
    assert_response :success
  end

  test "should update reply" do
    log_in_as(@user)
    @reply.save
    patch reply_path(@reply), params: { reply: { content: "reply content minimum" } }
    assert_redirected_to @reply
  end

  test "should destroy reply" do
    assert_difference('Reply.count', -1) do
      delete reply_url(@reply)
    end

    assert_redirected_to replies_url
  end
end
