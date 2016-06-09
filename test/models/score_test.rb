require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:questions)
  should have_many(:quizzes)

  def setup
    @user = users(:joe)
    @score = Score.new(user_id: @user.id, correct: 10, incorrect: 5)
  end

  test "should be valid" do
    assert @score.valid?
  end

  test "should belong to a user" do
    @score.user_id = nil
    assert_not @score.valid?
  end

  test "should have a value for correct" do
    @score.correct = nil
    assert_not @score.valid?
  end

  test "should have a value for incorrect" do
    @score.incorrect = nil
    assert_not @score.valid?
  end
end
