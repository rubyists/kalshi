# frozen_string_literal: true

require_relative '../../helper'

describe Rubyists::Kalshi::Series::ForecastPercentileHistory do
  let(:client) { Rubyists::Kalshi::Client.new }
  let(:history) { client.series.forecast_percentile_history }
  let(:base_url) { Rubyists::Kalshi.config.base_url }

  describe '#fetch' do
    it 'fetches forecast percentile history' do
      series_ticker = 'KX-SERIES'
      ticker = 'KX-EVENT'
      percentiles = [50, 99]
      start_ts = 1_600_000_000
      end_ts = 1_600_000_060
      period_interval = 1

      stub_request(:get, "#{base_url}/series/#{series_ticker}/events/#{ticker}/forecast_percentile_history")
        .with(query: {
                percentiles: '50,99',
                start_ts: start_ts,
                end_ts: end_ts,
                period_interval: period_interval
              })
        .to_return(status: 200, body: '{"forecast_history": []}', headers: { 'Content-Type' => 'application/json' })

      response = history.fetch(
        series_ticker: series_ticker,
        ticker: ticker,
        percentiles: percentiles,
        start_ts: start_ts,
        end_ts: end_ts,
        period_interval: period_interval
      )

      assert_equal({ forecast_history: [] }, response)
    end

    it 'raises ArgumentError for invalid params' do
      assert_raises(ArgumentError) do
        history.fetch(series_ticker: 'KX-SERIES')
      end
    end
  end
end
