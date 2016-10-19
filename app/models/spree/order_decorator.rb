Spree::Order.class_eval do
  state_machine do
    if states[:payment]
      before_transition to: :payment, do: :create_service_fee!
    end
    if states[:address]
      before_transition from: :address, do: :create_service_fee!
    end
  end

  def create_service_fee!
    return if complete?
    Spree::ServiceFee.adjust(self, line_items)
  end

end
