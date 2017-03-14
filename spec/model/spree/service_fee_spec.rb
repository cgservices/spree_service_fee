require 'spec_helper'

describe Spree::ServiceFee do
  let(:order) { double('Spree::Order') }
  let(:line_item) { double('Spree::LineItem') }
  let(:line_items) { [line_item] }
  let(:adjustments) { [double('Spree::Adjustment')] }
  let(:service_fee) { instance_double('Spree::ServiceFee')}

  describe '.adjust' do

    before do
      allow(Rails).to receive_message_chain('application.config.spree.service_fee.enabled?') { true }
      allow(Spree::ServiceFee).to receive(:find).and_return service_fee
      allow(line_item).to receive_message_chain(:adjustments, :where).and_return adjustments
      allow(adjustments).to receive :destroy_all
      allow(service_fee).to receive :adjust
      allow(service_fee).to receive(:present?).and_return true
    end

    it 'adds the correct service fee on a reorder' do
      expect(adjustments).to receive(:destroy_all)
      expect(service_fee).to receive(:adjust).with(order, line_item)
      Spree::ServiceFee.adjust(order, line_items)
    end
  end
end
