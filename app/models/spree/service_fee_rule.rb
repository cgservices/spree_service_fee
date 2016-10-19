module Spree
  class ServiceFeeRule < Spree::Base

    belongs_to :service_fee, class_name: 'Spree::ServiceFee', inverse_of: :service_fee_rules

    def eligible?(adjustable)
      raise 'eligible? should be implemented in a sub-class of Spree::ServiceFeeRule'
    end

    def label
      self.class.name.demodulize.humanize
    end

  end
end
