class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :reactions, as: :reactive, dependent: :destroy

  validates :text, :user, presence: true

  scope :ordered, -> { order(created_at: :desc) }
end
