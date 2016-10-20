class ChangeServiceFeesIdToServiceFeeId < ActiveRecord::Migration
  def change
    if column_exists? :spree_service_fee_rules, :service_fees_id
      rename_column :spree_service_fee_rules, :service_fees_id, :service_fee_id
      rename_column :spree_service_fee_adjustments, :service_fees_id, :service_fee_id
    end
  end
end
