class AddServiceFeeTotalToSpreeOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :service_fee_total, :decimal, :precision => 10, :scale => 2
  end
end
