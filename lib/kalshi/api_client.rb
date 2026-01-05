# frozen_string_literal: true

module Rubyists
  module Kalshi
    # Base class for API client wrappers that automatically configure URL prefixes
    #
    # @example Using ApiClient with a Search namespace
    #   # For Rubyists::Kalshi::Search::Client, the prefix will be "search"
    #   class Search::Client < ApiClient
    #     # API calls will automatically use /search/ prefix
    #   end
    #
    # @example Overriding the automatic prefix
    #   class CustomClient < ApiClient
    #     self.prefix = 'custom_api'
    #   end
    class ApiClient
      attr_reader :client

      # Automatically extract the URL prefix from the module hierarchy
      #
      # The prefix is derived by taking the second-to-last component of the
      # fully qualified class name and converting it to lowercase. For example:
      #   - Rubyists::Kalshi::Search::Client => "search"
      #   - Rubyists::Kalshi::Market::Client => "market"
      #
      # @return [String] the URL prefix for API calls
      def self.prefix
        @prefix ||= to_s.split('::')[-2].downcase
      end

      # Set a custom URL prefix for API calls, for overriding the default behavior
      def self.prefix=(value) # rubocop:disable Style/TrivialAccessors
        @prefix = value
      end

      # Initialize the ApiClient with a given client instance
      #
      # @param client [Rubyists::Kalshi::Client] the client instance to wrap
      #
      # @return [void]
      def initialize(client)
        @client = client
        client.prefix = self.class.prefix
      end
    end
  end
end
