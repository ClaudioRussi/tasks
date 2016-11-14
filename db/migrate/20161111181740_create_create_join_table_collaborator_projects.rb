class CreateCreateJoinTableCollaboratorProjects < ActiveRecord::Migration[5.0]
  def change
    create_join_table :collaborator, :projects do |t|
      t.index :collaborator_id
      t.index :project_id
    end
  end
end
