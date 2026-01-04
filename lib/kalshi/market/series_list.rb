# frozen_string_literal: true

module Rubyists
  module Kalshi
    module Market
      # Series List API endpoint
      class SeriesList < Kalshi::Endpoint
        include Kalshi::Listable

        kalshi_path 'series'

        # Filter for Kalshi series list
        class Filter < Kalshi::Contract
          propertize(%i[category tags include_product_metadata isInitialized status])

          validation do
            params do
              optional(:category).maybe(:string)
              optional(:tags).maybe(:string)
              optional(:include_product_metadata).maybe(:bool)
              optional(:isInitialized).maybe(:bool)
              optional(:status).maybe(:string)
            end
          end
        end
      end
    end
  end
end
