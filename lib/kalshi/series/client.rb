# frozen_string_literal: true

module Rubyists
  module Kalshi
    module Series
      # Series API Client
      class Client < ApiClient
        def event_candlesticks
          EventCandlesticks.new(client)
        end

        def forecast_percentile_history
          ForecastPercentileHistory.new(client)
        end
      end
    end
  end
end
