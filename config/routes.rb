Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :service_fees do
      resources :service_fee_rules
      resources :service_fee_adjustments
      collection do
        post :update_positions
      end
    end
  end
end
