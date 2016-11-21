class Task < ApplicationRecord
  scope :pending, ->{where(status: 'Pending')}
  scope :in_progress, ->{where(status: 'In progress')}
  scope :finished, ->{where(status: 'Finished')}
  belongs_to :group
  has_and_belongs_to_many :workers, class_name: 'User', join_table: :tasks_workers, association_foreign_key: :worker_id

  validates :name, presence:true, length:{maximum:50, minimum:3}
  validates :description, presence:true, length:{maximum:400, minimum:10}
  validates :status, presence:true, inclusion: {in: ['In progress', 'Finished', 'Pending']}
end
