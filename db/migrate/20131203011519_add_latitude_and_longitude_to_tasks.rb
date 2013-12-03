class AddLatitudeAndLongitudeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :latitude, :float
    add_column :tasks, :longitude, :float
  end
end
