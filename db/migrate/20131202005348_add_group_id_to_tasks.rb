class AddGroupIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :group_id, :integer
    add_index :tasks, :group_id
  end
end
