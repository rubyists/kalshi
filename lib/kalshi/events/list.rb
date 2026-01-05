# frozen_string_literal: true

module Rubyists
  module Kalshi
    module Events
      # Events API endpoint
      class List < Kalshi::Endpoint
        include Kalshi::Listable

        kalshi_path ''

        # Filter for Kalshi events list
        class Filter < Kalshi::Contract
          propertize(%i[limit cursor status series_ticker with_nested_markets])

          validation do
            params do
              optional(:limit).maybe(:integer)
              optional(:cursor).maybe(:string)
              optional(:status).maybe(:string)
              optional(:series_ticker).maybe(:string)
              optional(:with_nested_markets).maybe(:bool)
            end
          end
        end

        def fetch(event_ticker)
          client.get(event_ticker)
        end

        def metadata(event_ticker)
          client.get("#{event_ticker}/metadata")
        end
      end
    end
  end
end
