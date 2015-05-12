class Ticket < ActiveRecord::Base
  belongs_to :project
  has_many :participants, class_name: "User", foreign_key: "leader_id"
  has_one :leader
  
end
