class Quiz < ActiveRecord::Base
  belongs_to :score
  belongs_to :question

  validates :score_id, presence: true
  validates :question_id, presence: true
end
