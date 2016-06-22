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
    vol_selected = false
    ['1','2','3'].each do |n|
      vol_selected = true if selected.include? n
    end
    if !vol_selected
      errors.add(:selected, "a volume must be selected")
    end
  end
end
