class AddUserIdToTaskInstance < ActiveRecord::Migration
  def change
    add_column :task_instances, :user_id, :integer
  end
end
