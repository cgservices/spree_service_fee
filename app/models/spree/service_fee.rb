module Spree
  class ServiceFee < ActiveRecord::Base
    acts_as_paranoid
    acts_as_list scope:'deleted_at IS NULL', add_new_at: :top

    default_scope {order(:position)}

    include Spree::AdjustmentSource

    has_many :service_fee_rules, autosave: true, dependent: :destroy
    alias_method :rules, :service_fee_rules

    has_many :service_fee_adjustments, dependent: :destroy
    alias_method :adjustment_amounts, :service_fee_adjustments

    accepts_nested_attributes_for :service_fee_adjustments, :service_fee_rules

    # Find and apply the correct service fee for the order
    def self.adjust(order, items)

      # Remove fees before continuing just to be sure
      Spree::Adjustment.where(adjustable: items).service_fee.destroy_all

      return unless Rails.application.config.spree.service_fee.enabled?

      items.each do |item|
        service_fee = Spree::ServiceFee.find{|service_fee| service_fee.eligible?(item)}
        service_fee.adjust(order, item) if service_fee.present?
      end

    end

    def adjust(order, adjustable)
      create_adjustment(order, adjustable)
    end

    def compute_amount(adjustable)
      raise 'Given adjustable does not contain a currency' unless adjustable.respond_to?(:currency)

      adjustment = adjustment_amounts.where(currency:adjustable.currency).first
      adjustment.present? ? adjustment.amount : 0.0
    end

    # Because we do not include CalculatedAdjustment we do this
    def compute(adjustable)
      compute_amount(adjustable)
    end

    def label
      Spree.t('payments.service_fee')
    end

    def description
      rules.map(&:label).join(', ')
    end

    def eligible?(adjustable)
      rules.all?{|rule| rule.eligible?(adjustable)}
    end
  end
end