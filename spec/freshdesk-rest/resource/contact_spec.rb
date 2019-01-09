require_relative '../../../lib/freshdesk-rest/resource/contact'
require_relative 'api_client_mock'

RSpec.describe Freshdesk::Rest::Resource::Contact do
  subject             { described_class.new(client: api) }
  let(:resource_type) { described_class.to_s.split('::').last.downcase }
  let(:api)           { double('Api') }

  it 'returns one project for the given id' do
    allow(api).to receive(:get)
      .with('/contacts/2015007548012')
      .and_return(ApiClientMock.fixture(resource_type, 'get.json'))
    project = subject.get(id: '2015007548012')
    expect(project[:id]).to eq 2015007548012
    expect(project[:name]).to eq 'some user'
    expect(project[:email]).to eq 'some+user@example.com'
  end

  it 'returns a list of contacts updated after a date' do
    allow(api).to receive(:get)
      .with('/contacts')
      .and_return(ApiClientMock.fixture(resource_type, 'list.json'))
    expect(subject.list.count).to eq 1
  end

  it 'returns nothing when project does not exists' do
    allow(api).to receive(:get).with('/contacts/non_existing_contact').and_return('[]')
    expect(subject.get(id: 'non_existing_contact')).to be_empty
  end
end
