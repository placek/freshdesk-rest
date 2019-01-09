require 'rest-client'
require 'webmock/rspec'
require_relative '../../lib/freshdesk-rest/api'

RSpec.describe Freshdesk::Rest::Api do
  let(:rest_client) { RestClient }
  let(:api_key)     { 'some_random_api_key' }
  let(:domain)      { 'some_random_domain' }
  let(:base_url)    { "https://#{domain}.freshdesk.com/api/v2" }
  subject { described_class.new(rest_client: rest_client, api_key: api_key, domain: domain) }

  describe '.get' do
    it 'returns an empty body when resource is found but without content' do
      stub_request(:get, "#{base_url}/some_path").to_return(status: 200, body: '[]')
      expect(subject.get('/some_path')).to eq '[]'
    end

    it 'returns an empty json array body when resource is not found' do
      stub_request(:get, "#{base_url}/some_wrong_path").to_return(status: 404, body: nil)
      expect(subject.get('/some_wrong_path')).to eq '[]'
    end
  end
end
