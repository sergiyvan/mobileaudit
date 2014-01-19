class AddTimeToFinishToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :time_to_finish, :integer, default: 180
    Task.update_all({ time_to_finish: 180 }, { time_to_finish: nil })
  end
end
