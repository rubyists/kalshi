# frozen_string_literal: true

module Rubyists
  module Kalshi
    module Market
      # Orderbook API endpoint
      class Orderbook < Kalshi::Endpoint
        def fetch(ticker, depth: nil)
          params = {}
          params[:depth] = depth if depth
          client.get("markets/#{ticker}/orderbook", params: params)
        end
      end
    end
  end
end
