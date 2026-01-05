# frozen_string_literal: true

module Rubyists
  module Kalshi
    module Events
      # Multivariate Events API endpoint
      class Multivariate < Kalshi::Endpoint
        include Kalshi::Listable

        kalshi_path 'multivariate'

        # Filter for Kalshi multivariate events list
        class Filter < Kalshi::Contract
          propertize(%i[limit cursor series_ticker collection_ticker])

          validation do
            params do
              optional(:limit).maybe(:integer)
              optional(:cursor).maybe(:string)
              optional(:series_ticker).maybe(:string)
              optional(:collection_ticker).maybe(:string)
            end
          end
        end
      end
    end
  end
end
