module Spree
  module Admin
    class ServiceFeeAdjustmentsController < Spree::Admin::ResourceController

      before_action :load_service_fee, only: [:create, :destroy]

      def create
        @service_fee_adjustment= Spree::ServiceFeeAdjustment.new()
        @service_fee_adjustment.service_fee = @service_fee
        if @service_fee_adjustment.save
          flash[:success] = Spree.t(:successfully_created, :resource => Spree.t(:service_fee_adjustment))
        end
        respond_to do |format|
          format.html { redirect_to spree.edit_admin_service_fees_path(@service_fee) }
          format.js { render :layout => false }
        end
      end

      def destroy
        @service_fee_adjustment = @service_fee.service_fee_adjustments.find(params[:id])
        if @service_fee_adjustment.destroy
          flash[:success] = Spree.t(:successfully_removed, :resource => Spree.t(:service_fee_adjustment))
        end
        respond_to do |format|
          format.html { redirect_to spree.edit_admin_service_fees_path(@service_fee)}
          format.js   { render :layout => false }
        end
      end

      protected

      def load_service_fee
        @service_fee = Spree::ServiceFee.find(params[:service_fee_id])
      end

    end
  end
end
