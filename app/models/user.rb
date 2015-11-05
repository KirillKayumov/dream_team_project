class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments

  validates :full_name, presence: true

  def followers
    User.where(id: Relationship.where(user_id: id).pluck(:follower_id))
  end

  def following
    User.where(id: Relationship.where(follower_id: id).pluck(:user_id))
  end

  def add_follower(user)
    Relationship.create(user_id: id, follower_id: user.id)
  end

  def follower_of?(user)
    Relationship.where(user_id: user.id, follower_id: id).exists?
  end

  def remove_follower(user)
    relationship = Relationship.find_by(user_id: id, follower_id: user.id)
    relationship.try(:destroy)
  end

  def to_s
    full_name
  end

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end
end
