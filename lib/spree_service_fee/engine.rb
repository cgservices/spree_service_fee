module SpreeServiceFee
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_service_fee'

    initializer 'spree.service_fee.environment', before: :load_config_initializers do |app|
      app.config.spree.add_class('service_fee')
      app.config.spree.service_fee = Spree::ServiceFeeEnvironment::Environment.new
      app.config.spree.service_fee.rules = []
    end

    config.after_initialize do
      Rails.application.config.spree.service_fee.rules.concat [
          Spree::ServiceFee::Rules::MinimumAmount,
          Spree::ServiceFee::Rules::MaximumAmount
      ]
    end

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
