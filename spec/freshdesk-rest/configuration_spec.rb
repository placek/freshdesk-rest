require_relative '../../lib/freshdesk-rest/configuration'

RSpec.describe Freshdesk::Rest::Configuration do
  let(:key)     { double }
  let(:dom)     { double }
  let(:service) { described_class.new }

  describe '#api_key' do
    subject { service.api_key }

    context 'pre configured' do
      before { service.api_key = key }
      before { service.domain = dom }

      it { expect(subject).to eq(key) }
    end

    context 'an API key is not set' do
      before { service.domain = dom }

      it { expect{subject}.to(raise_error 'Freshdesk API key not defined') }
    end
  end

  describe '#domain' do
    subject { service.domain }

    context 'pre configured' do
      before { service.api_key = key }
      before { service.domain = dom }

      it { expect(subject).to eq(dom) }
    end

    context 'an domain is not set' do
      before { service.api_key = key }

      it { expect{subject}.to(raise_error 'Freshdesk domain not defined') }
    end
  end
end
