require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @course = courses(:one)
    @post = posts(:one)
    @reply = replies(:one)
    @user = users(:one)
    
    
    @post.course_id = @course.id
    @post.user_id = @user.id
    @reply.post_id = @post.id
    @reply.user_id = @user.id
  end
  
  test "should be valid" do
    assert @reply.valid?
  end
  
  test "content can't be blank" do
    @reply.content = " " * 15
    assert_not @reply.valid?
  end
  
  test "post_id must be valid" do
    @reply.post_id = nil
    assert_not @reply.valid?
    if Post.first != nil
      @reply.post_id = Post.first.id
      assert @reply.valid?
    end
  
  end
  
  test "content should be atleast 8 characters" do
    @reply.content = "a" * 7
    assert_not @reply.valid?
    
    @reply.content = "a" * 8
    assert @reply.valid?
  end
  
end
