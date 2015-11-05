class Relationship < ActiveRecord::Base
  validates :user_id, :follower_id, presence: true
  validates :user_id, uniqueness: { scope: :follower_id }
  validate :self_relationship

  protected

  def self_relationship
    errors.add(:base, "Can't follow yourself") if user_id == follower_id
  end
end
