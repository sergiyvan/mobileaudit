class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.text :address
      t.integer :price
      t.integer :expirience
      t.string :status
      t.string :task_type
      t.string :content
      t.integer :exp_require

      t.timestamps
    end
  end
end
