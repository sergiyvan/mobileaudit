class AddTaskIdToTaskInstance < ActiveRecord::Migration
  def change
    add_column :task_instances, :task_id, :integer
  end
end
