class ConnectionRequest < ApplicationRecord
  belongs_to :user
  belongs_to :connection, class_name: 'User'
  validates :status, presence: true, inclusion: {in:['Accepted','Unconfirmed']}

  def self.accepted
    where(status: 'Accepted')
  end
end
