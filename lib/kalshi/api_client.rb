# frozen_string_literal: true

module Rubyists
  module Kalshi
    # API Client Base Class
    class ApiClient
      attr_reader :client

      def initialize(client)
        @client = client
      end
    end
  end
end
