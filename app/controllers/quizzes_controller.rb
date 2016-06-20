class QuizzesController < ApplicationController
  before_action :set_current_user
  before_action :logged_in_user
  require 'json'

  def show
    @quiz = QuizFacade.new(@user)
  end

  def update
    score = @user.scores.last
    if score.questions.exists?(params[:id])
      increment_score(score, params[:id], params[:correct])
    end
    redirect_to score_quiz_path(score, score.questions.first)
  end

  private

    # Sets user variable.
    def set_current_user
      @user = current_user if logged_in?
      @user ||= User.first if Rails.env.development?
    end

    # Increment score depending on answer.
    def increment_score(score, question, answer)
      score.questions.destroy(question)
      correct = to_boolean(answer)
      correct ? score.correct += 1 : score.incorrect += 1
      score.save
    end
end
