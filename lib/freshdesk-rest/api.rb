module Freshdesk
  module Rest
    class Api
      def initialize(rest_client:, api_key:, domain:)
        @client = rest_client
        @api_key = api_key
        @domain = domain
      end

      def get(path)
        resource(path).get.body
      rescue @client::ExceptionWithResponse => e
        return '[]' if e.response.code == 404
        raise e
      end

      def post(path)
        resource(path).post.body
      end

      private

      def resource(path)
        @client::Resource.new([base_url, path].join, @api_key, 'X')
      end

      def base_url
        @base_url ||= "https://#{@domain}.freshdesk.com/api/v2".freeze
      end
    end
  end
end
