# frozen_string_literal: true

module Rubyists
  module Kalshi
    # API Client Base Class
    class ApiClient
      attr_reader :client

      def self.prefix
        @prefix ||= to_s.split('::')[-2].downcase
      end

      def self.prefix=(value) # rubocop:disable Style/TrivialAccessors
        @prefix = value
      end

      def initialize(client)
        @client = client
        client.prefix = self.class.prefix
      end
    end
  end
end
