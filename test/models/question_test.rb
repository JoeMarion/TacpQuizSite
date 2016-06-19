require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  should have_many(:scores)
  should have_many(:quizzes)
  should have_many(:answers)

  def setup
    @question = Question.new(question: "Test question", volume: 1)
  end

  test "should be valid" do
    assert @question.valid?
  end

  test "should have a question" do
    @question.question = "   "
    assert_not @question.valid?
  end

  test "should have a volume number" do
    @question.volume = nil
    assert_not @question.valid?
  end
end
