class ChangeColumnFromTasks < ActiveRecord::Migration[5.0]
  def up
    change_column(:tasks, :status, :string, default: 'Pending')
  end

  def down
    change_column(:tasks, :status, :string)
  end
end
