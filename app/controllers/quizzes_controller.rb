class QuizzesController < ApplicationController
  before_action :set_current_user
  before_action :logged_in_user
  require 'json'

  def show
    @quiz = params[:id]
    @score = @user.scores.last
    questions = @score.questions
    @question = questions.first
    @answers = questions.first.answers.shuffle
    percent_dec = @score.correct / (@score.correct + @score.incorrect.to_f)
    @percentage = ("%.2f" % percent_dec).to_f * 100

    if flash[:success]
    elsif !cookies[:question].nil?
      question = Question.where(question: cookies[:question])
      @score.questions.destroy(question)
      cookies.delete :question
      @question = questions.second
    else
      question = @score.questions.first
      @score.questions.destroy(question)
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
