require_relative '../../lib/freshdesk-rest'

RSpec.describe Freshdesk::Rest::Factory do
  subject { described_class }
  let(:config) { double('Freshdesk::Rest::Configuration') }

  it 'returns an Api' do
    Freshdesk::Rest.configure do |config|
      config.api_key = 'SOME_FRESHDESK_API_KEY'
      config.domain = 'SOME_FRESHDESK_DOMAIN'
    end
    expect(subject.api).to be_a Freshdesk::Rest::Api
  end
end
