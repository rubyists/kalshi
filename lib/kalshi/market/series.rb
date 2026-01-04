# frozen_string_literal: true

module Rubyists
  module Kalshi
    module Market
      # Series API endpoint
      class Series < Kalshi::Endpoint
        def fetch(ticker)
          client.get("series/#{ticker}")
        end
      end
    end
  end
end
