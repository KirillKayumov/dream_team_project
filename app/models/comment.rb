class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :reactions, as: :reactive

  validates :text, :user, :post, presence: true

  scope :ordered, -> { order(created_at: :asc) }
end
