class AddServiceFeeTotalToSpreeShipments < ActiveRecord::Migration
  def change
    add_column :spree_shipments, :service_fee_total, :decimal, precision: 10, scale: 2
  end
end
