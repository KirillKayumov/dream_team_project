class Reaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :reactive, polymorphic: true

  validates :user, :reactive, presence: true
  validates :user, uniqueness: { scope: :reactive }

  scope :positive, -> { where(positive: true) }
  scope :negative, -> { where(positive: false) }
end
