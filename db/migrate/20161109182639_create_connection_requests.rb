class CreateConnectionRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :connection_requests do |t|
      t.references :user, foreign_key: :true
      t.references :connection, foreign_key: :true
      t.string :status, default_value: 'Pending'
      t.timestamps
    end
  end
end
