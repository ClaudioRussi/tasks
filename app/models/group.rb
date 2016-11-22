class Group < ApplicationRecord
  has_many :tasks
  belongs_to :project

  validates :name, presence: true, length:{maximum:20, minimum:3} 

end
