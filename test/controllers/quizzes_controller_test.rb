require 'test_helper'

class QuizzesControllerTest < ActionController::TestCase
  def setup
    @user = users(:joe)
    @user_quiz = scores(:joe)
    @other_quiz = scores(:archerquiz)
    question = questions(:cdc)
    Quiz.create(score: @user_quiz, question: question)
  end

  test "should redirect show if not logged in" do
    skip
  end

  test "should get show if logged in and has a current quiz" do
    skip
  end

  test "should redirect after question is answered" do
    skip
  end

  test "should redirect to root path after finishing quiz" do
    skip
  end

  test "should redirect to new score path if quiz does not belong to logged in user" do
    skip
  end
end
