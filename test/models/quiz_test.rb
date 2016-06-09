require 'test_helper'

class QuizTest < ActiveSupport::TestCase
  should belong_to(:score)
  should belong_to(:question)

  def setup
    score = scores(:joe)
    question = questions(:cdc)
    @quiz = Quiz.create!(score: score, question: question)
  end

  test "should be valid" do
    assert @quiz.valid?
  end

  test "should have a score id" do
    @quiz.score_id = nil
    assert_not @quiz.valid?
  end

  test "should have a question id" do
    @quiz.question_id = nil
    assert_not @quiz.valid?
  end
end
