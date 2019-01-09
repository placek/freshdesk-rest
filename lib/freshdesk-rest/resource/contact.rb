require_relative 'parser'

module Freshdesk
  module Rest
    module Resource
      class Contact
        def initialize(client:)
          @client = client
          @path = '/contacts'
        end

        def list
          Parser.parse(@client.get(@path))
        end

        def get(id:)
          Parser.parse(@client.get("#{@path}/#{id}"))
        end
      end
    end
  end
end
