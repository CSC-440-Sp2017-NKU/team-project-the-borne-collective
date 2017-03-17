require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @forum = Forum.create(subject: "Computer Science")
    @post = Post.create(title: "some title", content: "some content", forum_id: @forum.id)
    @reply = Reply.create(content: "some content", post_id: @post.id)
  end
  
  test "should be valid" do
    assert @reply.valid?
  end
  
end
