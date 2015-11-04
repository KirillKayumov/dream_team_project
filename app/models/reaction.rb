class Reaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :reactive, polymorphic: true

  scope :positive, -> { where(positive: true) }
  scope :negative, -> { where(positive: false) }
end
