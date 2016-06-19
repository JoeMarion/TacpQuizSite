class Score < ActiveRecord::Base
  validates :user_id, presence: true
  validates :correct, :incorrect, presence: true

  has_many :quizzes
  has_many :questions, through: :quizzes
  belongs_to :user

end
