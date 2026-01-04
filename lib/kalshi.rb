# frozen_string_literal: true

require 'semantic_logger'
require 'zeitwerk'
require 'dry-configurable'
require_relative 'kalshi/version'

module Rubyists
  # Kalshi module
  module Kalshi
    extend Dry::Configurable

    setting :api_key, default: ENV.fetch('KALSHI_API_KEY', nil)
    setting :pem, default: ENV.fetch('KALSHI_PRIVATE_KEY', nil)
    setting :base_url, default: 'https://api.elections.kalshi.com/trade-api/v2'

    include SemanticLogger::Loggable

    class Error < StandardError; end

    # Operation submodule, for Trailblazer operations
    module Operation; end

    def self.client
      @client ||= Client.new
    end
  end
end

loader = Zeitwerk::Loader.new
loader.tag = 'rubyists-kalshi'
loader.push_dir("#{__dir__}/kalshi", namespace: Rubyists::Kalshi)
loader.push_dir("#{__dir__}/kalshi/operations", namespace: Rubyists::Kalshi::Operation)
loader.ignore("#{__dir__}/kalshi/version.rb")
loader.setup
