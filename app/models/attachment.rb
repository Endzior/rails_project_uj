class Attachment < ActiveRecord::Base
  belongs_to :ticket
  has_attached_file :attachedfile
end
