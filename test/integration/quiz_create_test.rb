require 'test_helper'

class QuizCreateTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:joe)
    @score = scores(:joe)
  end

  # test "can create a new quiz" do
  #   skip
  #   visit login_path
  #   fill_in 'Email', with: @user.email
  #   fill_in 'Password', with: 'password'
  #   click_button('Log in')
  #   visit root_path
  #   click_link "Start Quiz"
  #   assert_equal current_path,
  #     new_score_path
  #   check 'score_selected_1'
  #   check 'score_selected_2'
  #   click_button('Start Quiz')
  #   assert_template 'quizzes/show'
  # end

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

  end
end
