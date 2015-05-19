class Attachment < ActiveRecord::Base
  belongs_to :ticket
  has_attached_file :attachedfile
  validates_attachment_file_name :attachedfile, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/, /txt\Z/, /docx?\Z/ ,/ppt\Z/, /pdf\Z/,/xls\Z/]
  
end
