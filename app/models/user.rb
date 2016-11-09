class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true, length:{maximum:20, minimum:3}
  validates :last_name, presence: true, length:{maximum:20, minimum:3}

  has_many :authored_projects, class_name: 'Project', foreign_key: :author_id

  def full_name
    first_name + ' ' + last_name
  end
end
