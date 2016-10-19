class AddPropertiesToSpreeServiceFees < ActiveRecord::Migration
  def change
    change_table :spree_service_fees do |t|
      t.string :name
      t.integer :sequence

      t.timestamps

      t.datetime :deleted_at
      t.index :deleted_at
    end
  end
end
