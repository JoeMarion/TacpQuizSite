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
      score.questions.destroy(params[:id])
      correct = to_boolean(params[:correct])
      correct ? score.correct += 1 : score.incorrect += 1
      score.save
    end
    question = score.questions.first
    # debugger
    redirect_to score_quiz_path(score, question)
  end

  def create
  end

  def destroy

  end

  private

    # Sets user variable
    def set_current_user
      @user = current_user if logged_in?
      @user ||= User.first if Rails.env.development?
    end
end
