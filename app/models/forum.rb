class Forum < ActiveRecord::Base
  validates :category, presence: true,
                       length: { maximum: 255, minimum: 4 },
                       uniqueness: { case_sensitive: false }
  has_many :topics
end
