module Spree
  module Admin
    class ServiceFeeRulesController < Spree::Admin::ResourceController
      helper 'spree/service_fee_rules'

      before_action :load_service_fee, only: [:create, :destroy]

      def create
        service_fee_rule_type = params[:service_fee_rule].delete(:type)
        @service_fee_rule = service_fee_rule_type.constantize.new(params[:service_fee_rule])
        @service_fee_rule.service_fee = @service_fee
        if @service_fee_rule.save
          flash[:success] = Spree.t(:successfully_created, :resource => Spree.t(:service_fee_rule))
        end
        respond_to do |format|
          format.html { redirect_to spree.edit_admin_service_fees_path(@service_fee) }
          format.js { render :layout => false }
        end
      end

      def destroy
        @service_fee_rule = @service_fee.service_fee_rules.find(params[:id])
        if @service_fee_rule.destroy
          flash[:success] = Spree.t(:successfully_removed, :resource => Spree.t(:service_fee_rule))
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
