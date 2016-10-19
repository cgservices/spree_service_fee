module Spree
  module ServiceFeeRulesHelper
    def availible_service_fee_rules(sf)
      existing = sf.rules.map{|rule| rule.class.name}
      rule_names = Rails.application.config.spree.service_fee.rules.map(&:name).reject{ |r| existing.include? r }
      options = rule_names.map { |name| [ Spree.t("service_fee_rule_types.#{name.demodulize.underscore}.name"), name] }
      options_for_select(options)
    end
  end
end