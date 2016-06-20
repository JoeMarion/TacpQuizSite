require 'test_helper'

class QuizCreateTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:joe)
    @score = scores(:joe)
  end

  test "can create a new quiz" do
    get new_score_path
    assert_redirected_to login_path
    log_in_as(@user)
    assert_redirected_to new_score_path
    assert_difference 'Score.count', 1 do
      post scores_path(@score), score: { selected: ['0', '1'] }
    end
    follow_redirect!
    assert_template 'quizzes/show'
  end

  test "can not create an empty quiz" do
    get new_score_path
    assert_redirected_to login_path
    log_in_as(@user)
    assert_redirected_to new_score_path
    assert_no_difference 'Score.count' do
      post scores_path(@score), score: { selected: ['0'] }
    end
    follow_redirect!
    assert_template 'scores/new'
  end
end
