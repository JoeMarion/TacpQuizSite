class Score < ActiveRecord::Base
  validates :user_id, presence: true
  validates :correct, :incorrect, presence: true

  has_many :quizzes
  has_many :questions, through: :quizzes
  belongs_to :user

  # Build quiz for user
  def self.build_quiz(score, volumes)
    questions = (volumes).inject([]) { |listed, n|
      listed << Question.where(volume: n) if n != 0
    }.flatten

    questions.each do |question|
      Quiz.create!(score: score, question: question)
    end
  end
end
