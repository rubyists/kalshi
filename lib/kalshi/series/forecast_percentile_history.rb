# frozen_string_literal: true

module Rubyists
  module Kalshi
    module Series
      # Event Forecast Percentile History API endpoint
      class ForecastPercentileHistory < Kalshi::Endpoint
        # Filter for Event Forecast Percentile History
        class EventFilter < Kalshi::Contract
          propertize(%i[series_ticker ticker percentiles start_ts end_ts period_interval])

          validation do
            params do
              required(:series_ticker).filled(:string)
              required(:ticker).filled(:string)
              required(:percentiles).filled(:array)
              required(:start_ts).filled(:integer)
              required(:end_ts).filled(:integer)
              required(:period_interval).filled(:integer)
            end
          end
        end

        def fetch(params)
          filter = EventFilter.new(EventFilter::Properties.new(**params))
          raise ArgumentError, filter.errors.full_messages.join(', ') unless filter.validate({})

          path = "#{filter.series_ticker}/events/#{filter.ticker}/forecast_percentile_history"
          query_params = filter.to_h.slice('start_ts', 'end_ts', 'period_interval')
          query_params[:percentiles] = filter.percentiles.join(',')
          client.get(path, params: query_params)
        end
      end
    end
  end
end
