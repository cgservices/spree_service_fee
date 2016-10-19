class CreateSpreeServiceFeeAdjustments < ActiveRecord::Migration
  def change
    create_table :spree_service_fee_adjustments do |t|
      t.belongs_to :service_fee

      t.decimal :amount, :precision => 10, :scale => 2
      t.string :currency

      t.timestamps
      t.datetime :deleted_at
      t.index :deleted_at
    end
  end
end
