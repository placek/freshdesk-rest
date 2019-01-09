require_relative 'freshdesk-rest/factory'
require_relative 'freshdesk-rest/version'
require_relative 'freshdesk-rest/configuration'
require_relative 'freshdesk-rest/resource/contact'

module Freshdesk
  module Rest
    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.reset
      @configuration = Configuration.new
    end

    def self.configure
      yield(configuration)
    end
  end
end
