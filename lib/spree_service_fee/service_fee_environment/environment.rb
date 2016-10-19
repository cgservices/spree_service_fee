module Spree
  module ServiceFeeEnvironment
    class Environment
      include Spree::Core::EnvironmentExtension

      @enabled = true

      attr_accessor :rules

      def enabled=(value)
        @enabled = value
      end

      def enabled?
        @enabled
      end

    end
  end
end
