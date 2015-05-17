class Ticket < ActiveRecord::Base
  belongs_to :project
  has_many :participants, class_name: "User", foreign_key: "leader_id"
  has_one :leader
  validates :priority, :name, :description, :difficulty, :status, :project_id, presence: true
  
  def get_priority
    case priority
    when 1
      return 'very low'
    when 2
      return 'low'
    when 3
      return 'normal'
    when 4
      return 'high'
    else
      return 'very high'
    end
  end
  
  def get_difficulty
    case difficulty
    when 1
      return 'very easy'
    when 2
      return 'easy'
    when 3
      return 'medium'
    when 4
      return 'hard'
    else
      return 'very hard'
    end
  end
end
