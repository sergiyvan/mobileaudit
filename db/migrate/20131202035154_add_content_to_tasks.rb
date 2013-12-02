class AddContentToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :content, :text
  end
end
