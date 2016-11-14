class ConnectionRequest < ApplicationRecord
  belongs_to :user
  belongs_to :connection, class_name: 'User'

  def self.accepted
    where(status: 'Accepted')
  end
end
