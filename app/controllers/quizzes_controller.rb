class QuizzesController < ApplicationController
  before_action :set_current_user

  def show
    @score = @user.scores.last
    questions = @score.questions
    @question = questions.first
    @answers = questions.first.answers.shuffle
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
