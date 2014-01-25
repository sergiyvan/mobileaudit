class AddTakenAtToTaskInstance < ActiveRecord::Migration
  def change
    add_column :task_instances, :taken_at, :datetime
  end
end
