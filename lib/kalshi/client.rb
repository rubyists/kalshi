# frozen_string_literal: true

require 'httpx'
require 'json'
require 'uri'

module Rubyists
  module Kalshi
    # HTTP Client for Kalshi API
    class Client
      include SemanticLogger::Loggable

      attr_reader :http, :base_url
      attr_accessor :prefix

      def initialize(base_url: Kalshi.config.base_url)
        @base_url = base_url
        @http = HTTPX.plugin(:persistent)
                     .plugin(:rate_limiter)
                     .with(origin: base_url)
      end

      # Get response from a path, adding the base_url,
      # and a prefix, if set on the client.
      #
      # see #full_path for details
      #
      # @param path [String] The URL path
      #
      # @return [Hash] The parsed JSON response
      def get(path, params: {})
        get_url(full_url(path), params:)
      end

      # Get response from a URL
      # Must pass a full URL, including scheme (http/https), host, etc.
      #
      # @param path [String] The full URL path
      #
      # @return [Hash] The parsed JSON response
      def get_url(url, params: {})
        uri = URI.parse(url)
        raise ArgumentError, 'URL must be http or https' unless %w[http https].include?(uri.scheme)

        response = @http.get(url, params:)
        handle_response(response)
      rescue ArgumentError => e
        logger.error('Invalid URL', url:, exception: e)
        raise Error, "Invalid URL: #{e.message}"
      end

      def market
        @market ||= Market::Client.new(clone)
      end

      def search
        @search ||= Search::Client.new(clone)
      end

      def events
        @events ||= Events::Client.new(clone)
      end

      private

      def full_url(path)
        parts = [base_url, prefix, path].compact
        parts.reject!(&:empty?)
        File.join(*parts)
      end

      def handle_response(response)
        response.raise_for_status
        JSON.parse(response.body.to_s, symbolize_names: true)
      rescue HTTPX::HTTPError => e
        logger.error('API Error', e)
        raise Error, "API Error: #{e.response.status} - #{e.response.body}"
      end
    end
  end
end
