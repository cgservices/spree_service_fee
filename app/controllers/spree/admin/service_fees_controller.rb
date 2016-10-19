module Spree
  module Admin
    class ServiceFeesController < Spree::Admin::ResourceController
      helper 'spree/service_fee_rules'

      protected

      def location_after_save
        spree.edit_admin_service_fee_url(@service_fee)
      end

    end
  end
end
