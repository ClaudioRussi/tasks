class Project < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :groups
  validates :author, presence: true
  validates :name, presence: true, length:{maximum:20, minimum:3}
  validates :description, presence: true, length:{maximum:400, minimum:20}
end
