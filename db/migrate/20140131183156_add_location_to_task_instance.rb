class AddLocationToTaskInstance < ActiveRecord::Migration
  def change
    add_column :task_instances, :agent_pos_lat, :float
    add_column :task_instances, :agent_pos_long, :float
  end
end
