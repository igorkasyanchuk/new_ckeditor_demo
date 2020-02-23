class Attachment < ApplicationRecord
  mount_uploader :file, AttachmentUploader

  validates_presence_of :file
end
