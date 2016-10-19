module Spree
  class ServiceFeeAdjustment < Spree::Base
    acts_as_paranoid

    belongs_to :service_fee, class_name: 'Spree::ServiceFee'

  end
end
