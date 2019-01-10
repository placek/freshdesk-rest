require_relative '../../../lib/freshdesk-rest/resource/contact'

RSpec.describe Freshdesk::Rest::Resource::Contact do
  let(:service)       { described_class.new(client: api) }
  let(:resource_type) { described_class.to_s.split('::').last.downcase }
  let(:api)           { double('Api') }
  before              { allow(JSON).to receive(:parse).and_return(result) }
  let(:response)      { double }
  let(:result)        { double }

  describe '#list' do
    context 'without params'do
      before  { allow(api).to receive(:get).with('/contacts').and_return(response) }
      subject { service.list }

      it { is_expected.to eq(result) }
    end

    context 'with params'do
      before  { allow(api).to receive(:get).with('/contacts?unique_external_id=123123123').and_return(response) }
      subject { service.list(params: { unique_external_id: '123123123' }) }

      it { is_expected.to eq(result) }
    end
  end

  describe '#get' do
    before  { allow(api).to receive(:get).with('/contacts/2015007548012').and_return(response) }
    subject { service.get(id: '2015007548012') }

    it { is_expected.to eq(result) }
  end

  describe '#post' do
    before     { allow(api).to receive(:post).with('/contacts', data).and_return(response) }
    let(:data) { double }
    subject    { service.post(data: data) }

    it { is_expected.to eq(result) }
  end

  describe '#put' do
    before     { allow(api).to receive(:put).with('/contacts/2015007548012', data).and_return(response) }
    let(:data) { double }
    subject    { service.put(id: '2015007548012', data: data) }

    it { is_expected.to eq(result) }
  end
end
