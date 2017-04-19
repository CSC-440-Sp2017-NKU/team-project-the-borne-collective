require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @course = courses(:one)
    @user = users(:one)
    
    @post.user_id = @user.id
    @post.course_id = @course.id
  end

  test "should get new" do
    log_in_as(@user)
    get new_post_path
    assert_response :success
  end

  test "should create post" do
    log_in_as(@user)
    assert_difference('Post.count') do
      post posts_path, params: { post: { content: @post.content, title: @post.title, user_id: @user.id, course_id: @course.id } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    log_in_as(@user)
    get post_path(@post)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_post_path(@post)
    assert_response :success
  end

  test "should update post" do
    log_in_as(@user)
    @post.save
    patch post_url(@post), params: { post: { content: @post.content, title: @post.title, user_id: @user.id, course_id: @post.course_id } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
      log_in_as(@user)
      assert_difference('Post.count', -1) do
      delete post_path(@post)
    end

    assert_redirected_to root_url
  end
end
