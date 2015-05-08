class Project < ActiveRecord::Base
  has_and_belongs_to_many :tickets
  validates :name, presence: true,
                    length: { minimum: 5 }
end
