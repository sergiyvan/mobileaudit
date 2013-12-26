class AddExpCreditYandexToUser < ActiveRecord::Migration
  def change
    add_column :users, :exp, :integer
    add_column :users, :credit, :integer
    add_column :users, :yandex, :integer
  end
end
