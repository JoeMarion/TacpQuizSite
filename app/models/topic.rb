class Topic < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 4, maximum: 255 }
  validates :content, presence: true, length: { minimum: 4 }
  validates :forum_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :forum

  has_many :posts
end
