Spree::LineItem.class_eval do
  after_save :update_service_fee

  def update_service_fee
    order.create_service_fee!
  end

end
