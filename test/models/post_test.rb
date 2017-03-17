require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(title: "an example title",
                     content: "an example of post content",
                     user_id: 1)
  end
  
  test "should be valid" do
    assert @post.valid?
  end
  
  test "title should be present" do
    @post.title = "     "
    assert_not @post.valid?
  end
  
  test "body should be present" do
    @post.content = "    "
    assert_not @post.valid?
  end
  
  test "title must be between 6 and 150 characters" do
    @post.title = "a" * 5
    assert_not @post.valid?
    @post.title = "a" * 151
    assert_not @post.valid?
  end
  
  test "body should be atleast 8 characters" do
    @post.content = "a" * 7
    assert_not @post.valid?
    @post.content = "a" * 8
    assert @post.valid?
  end
  
  test "user_id should not be blank" do
      @post.user_id = nil
      @post.save
      assert @post.user_id != nil
  end
  
end
