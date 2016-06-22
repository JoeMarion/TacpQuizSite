class ScoresController < ApplicationController
  before_action :set_current_user
  before_action :logged_in_user

  def new
    @score = @user.scores.new
    # @quiz = @score.quizzes.new
  end

  def create
    @score = @user.scores.new(score_params)
    if @score.save
      build_quiz(@score, params[:score][:selected])
    else
      redirect_to new_score_path
    end
  end

  def show
  end

  private

    def score_params
      params.require(:score).permit(:selected => [])
    end

    def quiz_params
      params.require(:quiz).permit(:id, :score_id, :question_id)
    end

    # Sets user variable.
    def set_current_user
      @user = current_user if logged_in?
      @user ||= User.first if Rails.env.development?
    end

    # Build quiz for user using volumes selected.
    def build_quiz(score, volumes)
      questions = (volumes).inject([]) { |listed, n|
        listed << Question.where(volume: n) if n != 0
      }.flatten
      questions.each { |q| Quiz.create!(score: score, question: q) }
      redirect_to score_quiz_path(score, questions.first)
    end
end
