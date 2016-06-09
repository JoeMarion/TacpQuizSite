require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  def setup
    @user = users(:joe)
    @forum = Forum.create!(category: "News & Announcements")
    @topic = @forum.topics.new(title: "Testing the topic",
                               content: "User Post",
                               user_id: @user.id)
  end

  test "should be valid?" do
    assert @topic.valid?
  end

  test "topic should have a forum id" do
    @topic.forum_id = nil
    assert_not @topic.valid?
  end

  test "topic should have a user id" do
    @topic.user_id = nil
    assert_not @topic.valid?
  end

  test "title should be present" do
    @topic.title = " "
    assert_not @topic.valid?
  end

  test "title should have a minimum length" do
    @topic.title = "a" * 3
    assert_not @topic.valid?
  end

  test "title should not be too long" do
    @topic.title = "a" * 256
    assert_not @topic.valid?
  end

  test "content should be present" do
    @topic.content = " "
    assert_not @topic.valid?
  end

  test "content should have a minimum length" do
    @topic.content = "a" * 3
    assert_not @topic.valid?
  end
end
