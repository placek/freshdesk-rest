require_relative '../../lib/freshdesk-rest/configuration'

RSpec.describe Freshdesk::Rest::Configuration do
  subject { described_class.new }

  it 'raise an exception if a api_key is not set' do
    expect { subject.api_key } .to(raise_error 'Freshdesk API key not defined')
  end

  it 'raise an exception if a domain is not set' do
    expect { subject.domain } .to(raise_error 'Freshdesk domain not defined')
  end
end
