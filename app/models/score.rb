class Score < ActiveRecord::Base
  validates :user_id, presence: true
  validates :correct, :incorrect, presence: true
  validates :selected, presence: true
  validate :volume_selected

  has_many :quizzes
  has_many :questions, through: :quizzes
  belongs_to :user

  # Validates a volume has been selected
  def volume_selected
    if !selected.include? '1' # This only allows volume 1 to be selected, needs support for 2 & 3
      errors.add(:selected, "a volume must be selected")
    end
  end
end
