module Spree
  class ServiceFee
    module Rules
      class MaximumAmount < ServiceFeeRule
        preference :amount, :decimal, default: 1.00
        preference :currency, :string, default: 'USD' #Spree::Config.currency

        def eligible?(adjustable)
          price = 0

          # TODO: Does this need to be multiplied by the line item quantity??
          case adjustable
            when Spree::Order
              price = adjustable.line_items.map{|line_item| line_item.variant.price_in(preferred_currency).price}.sum
            when Spree::LineItem
              price = adjustable.variant.price_in(preferred_currency).price
          end

          price <= preferred_amount rescue false
        end

        def label
          "Minimum amount: #{preferred_amount}"
        end
      end
    end
  end
end
