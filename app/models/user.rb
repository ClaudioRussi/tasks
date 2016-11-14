class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true, length:{maximum:20, minimum:3}
  validates :last_name, presence: true, length:{maximum:20, minimum:3}

  has_many :authored_projects, class_name: 'Project', foreign_key: :author_id
  has_and_belongs_to_many :collaborating_projects, class_name: 'Project', join_table: 'collaborator_projects', foreign_key: 'collaborator_id', association_foreign_key: 'project_id'

  has_many :sent_connection_requests,->{where(status:'Unconfirmed')}, class_name: 'ConnectionRequest'
  has_many :received_connection_requests,->{where(status:'Unconfirmed')}, class_name: 'ConnectionRequest', foreign_key: :connection_id
  has_many :accepted_requests,->{where(status: "Accepted")}, class_name: 'ConnectionRequest', foreign_key: :user_id
  has_many :accepted_connections, through: :accepted_requests, source: :connection

  has_many :sent_connections, through: :sent_connection_requests, class_name:'User', source: :connection
  has_many :received_connections, through: :received_connection_requests, class_name: 'User', source: :user

  has_and_belongs_to_many :tasks_who_is_working, class_name: 'Task', join_table: :tasks_workers, foreign_key: :worker_id, association_foreign_key: :task_id

  def full_name
    first_name + ' ' + last_name
  end
end
