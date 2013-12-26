class AddDefaultValuesToExpAndCredit < ActiveRecord::Migration
	def up
	    change_column :users, :exp, :integer, :default => 0
	    change_column :users, :credit, :integer, :default => 0
	end

	def down
	    change_column :users, :exp, :integer, :default => nil
	    change_column :users, :credit, :integer, :default => nil
	end
end
