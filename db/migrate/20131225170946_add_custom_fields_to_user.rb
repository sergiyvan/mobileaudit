class AddCustomFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :gender, :string
    add_column :users, :phone, :string
    add_column :users, :birthday, :date
  end
end
