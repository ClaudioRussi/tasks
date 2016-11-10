class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true, length:{maximum:20, minimum:3}
  validates :last_name, presence: true, length:{maximum:20, minimum:3}

  has_many :authored_projects, class_name: 'Project', foreign_key: :author_id

  has_many :sent_connection_requests, class_name: 'ConnectionRequest'
  has_many :received_connection_request, class_name: 'ConnectionRequest', foreign_key: :connection_id
  has_many :accepted_connections, ->{where(status: "Accepted", user_id: id )}, class_name:'ConnectionRequest'

  has_many :connections, through: :accepted_connections, class_name:'User'

  def full_name
    first_name + ' ' + last_name
  end
end
