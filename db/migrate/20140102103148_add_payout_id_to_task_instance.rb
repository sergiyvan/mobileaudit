class AddPayoutIdToTaskInstance < ActiveRecord::Migration
  def change
    add_column :task_instances, :payout_id, :integer
    add_index :task_instances, :payout_id
  end
end
