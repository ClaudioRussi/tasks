class Task < ApplicationRecord
  belongs_to :group

  validates :name, presence:true, length:{maximum:50, minimum:3}
  validates :description, presence:true, length:{maximum:400, minimum:10}
end
