# frozen_string_literal: true

require_relative '../../helper'

describe Rubyists::Kalshi::Series::EventCandlesticks do
  let(:client) { Rubyists::Kalshi::Client.new }
  let(:candlesticks) { client.series.event_candlesticks }
  let(:base_url) { Rubyists::Kalshi.config.base_url }

  describe '#fetch' do
    it 'fetches event candlesticks' do
      series_ticker = 'KX-SERIES'
      ticker = 'KX-EVENT'
      start_ts = 1_600_000_000
      end_ts = 1_600_000_060
      period_interval = 1

      stub_request(:get, "#{base_url}/series/#{series_ticker}/events/#{ticker}/candlesticks")
        .with(query: { start_ts: start_ts, end_ts: end_ts, period_interval: period_interval })
        .to_return(status: 200, body: '{"market_candlesticks": []}', headers: { 'Content-Type' => 'application/json' })

      response = candlesticks.fetch(
        series_ticker: series_ticker,
        ticker: ticker,
        start_ts: start_ts,
        end_ts: end_ts,
        period_interval: period_interval
      )

      assert_equal({ market_candlesticks: [] }, response)
    end

    it 'raises ArgumentError for invalid params' do
      assert_raises(ArgumentError) do
        candlesticks.fetch(series_ticker: 'KX-SERIES')
      end
    end
  end
end
