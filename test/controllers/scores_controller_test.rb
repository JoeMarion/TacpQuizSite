require 'test_helper'

class ScoresControllerTest < ActionController::TestCase
  def setup
    @user = users(:joe)
    @other_user = users(:archer)
    @score = scores(:joe)
  end

  test "should redirect new if not logged in" do
    get :new
    assert_redirected_to login_path
  end

  test "should get new if logged in" do
    log_in_as(@user)
    get :new
    assert_template 'scores/new'
  end

  test "should redirect create if not logged in" do
    assert_no_difference 'Score.count' do
      post :create, score: { selected: "['1']" }
    end
    assert_redirected_to login_path
  end
end
