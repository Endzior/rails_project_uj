class Project < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  validates :name, presence: true,
                    length: { minimum: 5 }
  validates :description, presence: true
end
