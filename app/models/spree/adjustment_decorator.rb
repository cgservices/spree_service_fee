Spree::Adjustment.class_eval do
  scope :service_fee, -> { where(source_type: 'Spree::ServiceFee') }
end