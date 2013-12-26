class AddCommentToTaskInstances < ActiveRecord::Migration
  def change
    add_column :task_instances, :comment, :text, :default => ""
  end
end
