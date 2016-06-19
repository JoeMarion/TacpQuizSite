class QuizzesController < ApplicationController
  before_action :set_current_user
  before_action :logged_in_user
  require 'json'

  def show
    @quiz = QuizFacade.new(@user, params[:id])

    if flash[:success]
    elsif !cookies[:question].nil?
      question = Question.where(question: cookies[:question])
      @quiz.score.questions.destroy(question)
      cookies.delete :question
      @quiz.questions(@quiz.score.questions.second)
    else
      question = @quiz.score.questions.first
      @quiz.score.questions.destroy(question)
    end
  end

  def update
    score = @user.scores.last
    quiz = params[:id]
    correct = to_boolean(params[:correct])
    # debugger
    correct ? score.correct += 1 : score.incorrect += 1
    score.save
    redirect_to score_quiz_path(score, quiz)
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
