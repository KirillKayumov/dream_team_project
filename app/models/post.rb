class Post < ActiveRecord::Base
  include PgSearch

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :reactions, as: :reactive, dependent: :destroy
  has_many :attached_images, as: :attachable, dependent: :destroy

  validates :text, :user, presence: true

  scope :ordered, -> { order(created_at: :desc) }

  accepts_attachments_for :attached_images, attachment: :file

  pg_search_scope :search_by_text,
    against: :text,
    using: {
      tsearch: {
        prefix: true,
        dictionary: "russian"
      }
    }
end
