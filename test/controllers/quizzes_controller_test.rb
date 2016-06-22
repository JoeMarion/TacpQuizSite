require 'test_helper'

class QuizzesControllerTest < ActionController::TestCase
  def setup
    @user = users(:joe)
    @user_quiz = @user.scores.create(selected: "['1']") 
    @question = questions(:cdc)
    Quiz.create(score: @user_quiz, question: @question)
  end

  test "should redirect show if not logged in" do
    get :show
    assert_redirected_to login_path 
  end

  test "should get show if logged in and has a current quiz" do
    log_in_as(@user)
    get :show, score_id: @user_quiz.id, id: @question.id
    assert_template 'quizzes/show'
  end

  test "should redirect after question is answered" do
    log_in_as(@user)
    get :show, score_id: @user_quiz.id, id: @question.id
    assert_template 'quizzes/show'
    put :update, score_id: @user_quiz.id, id: 1, correct: true
    assert_redirected_to score_quiz_path(@user_quiz, @question.id)
  end

  test "should redirect to root path after finishing quiz" do
    skip
  end

  test "should redirect to new score path if quiz does not belong to logged in user" do
    skip
  end
end
