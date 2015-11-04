class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :text, :user, presence: true

  scope :ordered, -> { order(created_at: :desc) }
end
