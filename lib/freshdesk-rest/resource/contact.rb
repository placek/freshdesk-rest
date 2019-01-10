require_relative 'parser'

module Freshdesk
  module Rest
    module Resource
      class Contact
        def initialize(client:)
          @client = client
          @path = '/contacts'
        end

        def list(params: {})
          query = URI.encode_www_form(params.to_a)
          path = [@path, (query.empty? ? nil : query)].compact.join('?')
          Parser.parse(@client.get(path))
        end

        def get(id:)
          Parser.parse(@client.get("#{@path}/#{id}"))
        end

        def post(data:)
          Parser.parse(@client.post(@path, data))
        end

        def put(id:, data:)
          Parser.parse(@client.put("#{@path}/#{id}", data))
        end

        def delete(id:)
          Parser.parse(@client.delete("#{@path}/#{id}"))
        end
      end
    end
  end
end
