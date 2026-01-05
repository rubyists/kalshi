# frozen_string_literal: true

module Rubyists
  module Kalshi
    module Market
      # Markets API endpoint
      class Markets < Kalshi::Endpoint
        include Kalshi::Listable

        kalshi_path 'markets'

        # Filter for Kalshi markets list
        class Filter < Kalshi::Contract
          propertize(%i[limit cursor event_ticker series_ticker max_close_ts min_close_ts status tickers])

          validation do
            params do
              optional(:limit).maybe(:integer)
              optional(:cursor).maybe(:string)
              optional(:event_ticker).maybe(:string)
              optional(:series_ticker).maybe(:string)
              optional(:max_close_ts).maybe(:integer)
              optional(:min_close_ts).maybe(:integer)
              optional(:status).maybe(:string)
              optional(:tickers).maybe(:string)
            end
          end
        end

        def fetch(ticker)
          client.get("markets/#{ticker}")
        end
      end
    end
  end
end
