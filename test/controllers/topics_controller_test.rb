require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  def setup
    @user = users(:joe)
    @topic = topics(:topictest)
    @forum = forums(:announcements)
  end

  test "should redirect new when not logged in" do
    get :new, forum_id: @forum
    assert_redirected_to login_url
  end

  test "should redirect create when not logged in" do
    post :create, forum_id: @forum, topic: { title: @topic.title, content: @topic.content }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get :edit, forum_id: @forum, id: @topic
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, forum_id: @forum, id: @topic, topic: { title: @topic.title,
                                                     content: @topic.content }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Topic.count' do
      delete :destroy, forum_id: @forum, id: @topic
    end
    assert_redirected_to login_url
  end
end

# [:destroy]
