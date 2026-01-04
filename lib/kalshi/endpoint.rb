# frozen_string_literal: true

module Rubyists
  module Kalshi
    # Base class for Kalshi API endpoints
    class Endpoint
      attr_reader :client

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
