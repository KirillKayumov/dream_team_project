class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :text, :user, :post, presence: true

  scope :ordered, -> { order(created_at: :asc) }
end
