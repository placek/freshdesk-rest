require_relative '../../lib/freshdesk-rest'

RSpec.describe Freshdesk::Rest::Factory do
  let(:service) { described_class }
  let(:config)  { double('Freshdesk::Rest::Configuration') }
  before do
    Freshdesk::Rest.configure do |config|
      config.api_key = 'SOME_FRESHDESK_API_KEY'
      config.domain = 'SOME_FRESHDESK_DOMAIN'
    end
  end

  describe '.api' do
    subject { service.api }

    it { is_expected.to be_a(Freshdesk::Rest::Api) }
  end

  describe '.contact_resource' do
    subject { service.contact_resource }

    it { is_expected.to be_a(Freshdesk::Rest::Resource::Contact) }
  end
end
