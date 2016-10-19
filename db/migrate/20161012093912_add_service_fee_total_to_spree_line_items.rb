class AddServiceFeeTotalToSpreeLineItems < ActiveRecord::Migration
  def change
    add_column :spree_line_items, :service_fee_total, :decimal, :precision => 10, :scale => 2
  end
end
