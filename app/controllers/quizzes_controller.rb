class QuizzesController < ApplicationController
  before_action :set_current_user
  before_action :logged_in_user
  require 'json'

  def show
    @quiz = QuizFacade.new(@user)
  end

  def update
    score = Score.find(params[:score_id])
    increment_score(score, params[:id], params[:correct]) if score.questions.exists?(params[:id])
    if score.questions.count > 0
      redirect_to score_quiz_path(score, score.questions.first)
    else
      redirect_to root_path
    end
  end

  def create
  end

  def destroy

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
