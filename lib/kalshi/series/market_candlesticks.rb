# frozen_string_literal: true

module Rubyists
  module Kalshi
    module Series
      # Candlesticks API endpoint
      class MarketCandlesticks < Kalshi::Endpoint
        def fetch(series_ticker:, ticker:, start_ts:, end_ts:, period_interval:)
          path = "series/#{series_ticker}/markets/#{ticker}/candlesticks"
          params = { start_ts:, end_ts:, period_interval: }
          client.get(path, params:)
        end

        def batch(tickers:, series_ticker:, start_ts:, end_ts:, period_interval:)
          path = 'markets/candlesticks'
          params = {
            market_tickers: tickers.is_a?(Array) ? tickers.join(',') : tickers,
            series_ticker:,
            start_ts:,
            end_ts:,
            period_interval:
          }
          client.get(path, params:)
        end
      end
    end
  end
end
