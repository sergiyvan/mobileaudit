class CreateTaskInstances < ActiveRecord::Migration
  def change
    create_table :task_instances do |t|
      t.text :content
      t.string :status

      t.timestamps
    end
  end
end
