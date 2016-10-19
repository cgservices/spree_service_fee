module Spree
  module Adjustable
    module Adjuster
      class ServiceFee < Spree::Adjustable::Adjuster::Base
        def update
          service_fee = adjustments.service_fee
          service_fee_total = service_fee.reload.map(&:update!).compact.sum
          update_totals(service_fee_total)
        end

        private

        def adjustments
          adjustable.try(:all_adjustments) || adjustable.adjustments
        end

        def update_totals(service_fee_total)
          @totals[:service_fee_total] = service_fee_total
          @totals[:non_taxable_adjustment_total] += service_fee_total
        end
      end
    end
  end
end