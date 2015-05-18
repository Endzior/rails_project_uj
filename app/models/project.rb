class Project < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  belongs_to :user
  validates :name, presence: true,
                    length: { minimum: 5 }
  validates :description, presence: true
  
  def tickets_count
    tickets.count
  end
end
