class AddUserIdToPayout < ActiveRecord::Migration
  def change
    add_column :payouts, :user_id, :integer
    add_index :payouts, :user_id
  end
end
