class User < ActiveRecord::Base
  include PgSearch

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy

  validates :full_name, presence: true

  pg_search_scope :search_by_name, against: :full_name

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

  def reaction_to(object)
    reactions.find_by(reactive: object)
  end

  def to_s
    full_name
  end

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end
end
