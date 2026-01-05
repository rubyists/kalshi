# frozen_string_literal: true

module Rubyists
  module Kalshi
    module Market
      # Trades API endpoint
      class Trades < Kalshi::Endpoint
        include Kalshi::Listable

        kalshi_path 'markets/trades'

        # Filter for Kalshi trades list
        class Filter < Kalshi::Contract
          propertize(%i[limit cursor ticker min_ts max_ts])

          validation do
            params do
              optional(:limit).maybe(:integer)
              optional(:cursor).maybe(:string)
              optional(:ticker).maybe(:string)
              optional(:min_ts).maybe(:integer)
              optional(:max_ts).maybe(:integer)
            end
          end
        end
      end
    end
  end
end
