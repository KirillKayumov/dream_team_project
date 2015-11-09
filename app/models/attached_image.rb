class AttachedImage < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true

  attachment :file
end
