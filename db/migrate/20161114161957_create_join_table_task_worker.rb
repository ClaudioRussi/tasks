class CreateJoinTableTaskWorker < ActiveRecord::Migration[5.0]
  def change
    create_join_table :tasks, :workers do |t|
      t.index :task_id
      t.index :worker_id
    end
  end
end
