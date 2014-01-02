class CreatePayouts < ActiveRecord::Migration
  def change
    create_table :payouts do |t|
      t.integer :price
      t.string :status, default: "open"

      t.timestamps
    end
  end
end
