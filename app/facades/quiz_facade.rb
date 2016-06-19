class QuizFacade
  def initialize(user)
    @user = user
    @score = user.scores.last
  end

  def score
    @score = @user.scores.last
  end

  def questions
    @score.questions
  end

  def question(question = @score.questions.first)
    @question = question
  end

  def answers
    @answers = @question.answers.shuffle
  end

  def percentages
    percent_dec = @score.correct / (@score.correct + @score.incorrect.to_f)
    @percentage = ("%.2f" % percent_dec).to_f * 100
  end
end
