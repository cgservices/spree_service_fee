class CreateSpreeServiceFeeRules < ActiveRecord::Migration
  def change
    create_table :spree_service_fee_rules do |t|
      t.belongs_to :service_fee
      t.string :type
      t.text :preferences

      t.timestamps

    end
  end
end
