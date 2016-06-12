class ScoresController < ApplicationController
  before_action :set_current_user

  def new
    @score = @user.scores.new
    # @quiz = @score.quizzes.new
  end

  def create
    @score = @user.scores.new(score_params)
    if @score.save
      Score.build_quiz(@score, params[:score][:selected])
      redirect_to score_path @score
    else
      flash[:alert] = "You suck"
      render 'new'
    end
  end

  def show
  end

  private

    def score_params
      params.require(:score).permit(:id, :selected)
    end

    def quiz_params
      params.require(:quiz).permit(:id, :score_id, :question_id)
    end

    # Sets user variable
    def set_current_user
      @user = current_user if logged_in?
      @user ||= User.first if Rails.env.development?
    end
end
