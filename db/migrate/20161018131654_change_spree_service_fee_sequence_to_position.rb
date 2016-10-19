class ChangeSpreeServiceFeeSequenceToPosition < ActiveRecord::Migration
  def change
    rename_column :spree_service_fees, :sequence, :position
  end
end
