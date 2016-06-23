require 'test_helper'

class QuizzesControllerTest < ActionController::TestCase
  def setup
    @user = users(:joe)
    @user.scores.create(selected: "['1']") 
    question = questions(:cdc)
    question2 = questions(:cdc2)
    @quiz = QuizFacade.new(@user)
    Quiz.create(score: @quiz.score, question: question)
    Quiz.create(score: @quiz.score, question: question2)
  end

  test "should redirect show if not logged in" do
    get :show
    assert_redirected_to login_path 
  end

  test "should get show if logged in and has a current quiz" do
    log_in_as(@user)
    get :show, score_id: @quiz.score.id, id: @quiz.question.id
    assert_template 'quizzes/show'
  end

  test "should redirect after question is answered" do
    log_in_as(@user)
    get :show, score_id: @quiz.score.id, id: @quiz.question.id
    assert_template 'quizzes/show'
    put :update, score_id: @quiz.score.id, id: 1, correct: true
    assert_redirected_to score_quiz_path(@quiz.score, @quiz.question.id)
  end

  test "should redirect to root path after finishing quiz" do
    log_in_as(@user)
    @quiz.questions.destroy(@quiz.question)
    get :show, score_id: @quiz.score.id, id: @quiz.question.id
    assert_template 'quizzes/show'
    patch :update, score_id: @quiz.score.id, id: @quiz.question.id, correct: true
    assert_redirected_to root_path
  end

  test "should redirect to new score path if quiz does not belong to logged in user" do
    skip
  end
end
