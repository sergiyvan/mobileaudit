class AddExpdateToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :expdate, :date
    Task.update_all({ expdate: 1.year.from_now.beginning_of_day }, { expdate: nil })
  end
end
