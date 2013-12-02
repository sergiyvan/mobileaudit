class RemoveContentFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :content, :string
  end
end
