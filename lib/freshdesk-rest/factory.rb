require 'rest-client'
require_relative 'api'

module Freshdesk
  module Rest
    class Factory
      def self.api
        Freshdesk::Rest::Api.new(
          rest_client: RestClient,
          api_key: Freshdesk::Rest.configuration.api_key,
          domain: Freshdesk::Rest.configuration.domain
        )
      end

      def self.contact_resource
        Freshdesk::Rest::Resource::Contact.new(client: api)
      end
    end
  end
end
