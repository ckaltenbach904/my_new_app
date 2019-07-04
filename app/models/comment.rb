class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  
  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }

  validates_presence_of :rating
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }
  
  after_create_commit { CommentUpdateJob.perform_later(self, self.user) }
end
