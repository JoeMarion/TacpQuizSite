class Question < ActiveRecord::Base
  validates :question, :volume, presence: true

  has_many :quizzes
  has_many :scores, through: :quizzes
  has_many :answers
end
