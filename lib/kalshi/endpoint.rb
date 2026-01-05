# frozen_string_literal: true

module Rubyists
  module Kalshi
    # Base class for Kalshi API endpoints
    class Endpoint
      attr_reader :client

      class << self
        attr_accessor :endpoint_path

        # Set the endpoint path for the resource
        #
        # @param path [String] API endpoint path
        #
        # @return [String] endpoint path
        def kalshi_path(path)
          self.endpoint_path = path
        end
      end

      # Initialize the Endpoint
      #
      # @param client [Client] The Kalshi client
      #
      # @return [void]
      def initialize(client = nil)
        @client = client || Client.new
      end
    end
  end
end
