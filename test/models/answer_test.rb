require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  should belong_to(:question)

  def setup
    @answer = Answer.new(answer: "Career", correct: true, question_id: 1)
  end

  test "should be valid" do
    assert @answer.valid?
  end

  test "should have an answer" do
    @answer.answer = "  "
    assert_not @answer.valid?
  end

  test "should be true or false" do
    @answer.correct = nil
    assert_not @answer.valid?
  end

  test "should have a question id" do
    @answer.question_id = nil
    assert_not @answer.valid?
  end
end
