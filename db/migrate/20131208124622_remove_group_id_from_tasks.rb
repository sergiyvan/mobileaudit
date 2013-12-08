class RemoveGroupIdFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :group_id, :integer
  end
end
