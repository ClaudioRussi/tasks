class Project < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :groups
  has_many :tasks, through: :groups
  has_and_belongs_to_many :collaborators, class_name: 'User', join_table: :collaborator_projects, association_foreign_key: :collaborator_id

  validates :author, presence: true
  validates :name, presence: true, length:{maximum:20, minimum:3}
  validates :description, presence: true, length:{maximum:400, minimum:20}
end
