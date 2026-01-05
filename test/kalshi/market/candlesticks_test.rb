# frozen_string_literal: true

require_relative '../../helper'

describe Rubyists::Kalshi::Market::Candlesticks do
  let(:client) { Rubyists::Kalshi::Client.new }
  let(:candlesticks) { Rubyists::Kalshi::Market::Candlesticks.new(client) }
  let(:base_url) { Rubyists::Kalshi.config.base_url }

  describe '#fetch' do
    it 'fetches candlesticks for a market' do
      series_ticker = 'KX-SERIES'
      ticker = 'KX-MARKET'
      start_ts = 1_600_000_000
      end_ts = 1_600_000_060
      period_interval = 1

      stub_request(:get, "#{base_url}/series/#{series_ticker}/markets/#{ticker}/candlesticks")
        .with(query: { start_ts: start_ts, end_ts: end_ts, period_interval: period_interval })
        .to_return(status: 200, body: '{"candlesticks": []}', headers: { 'Content-Type' => 'application/json' })

      response = candlesticks.fetch(
        series_ticker: series_ticker,
        ticker: ticker,
        start_ts: start_ts,
        end_ts: end_ts,
        period_interval: period_interval
      )

      assert_equal({ candlesticks: [] }, response)
    end
  end

  describe '#batch' do
    it 'fetches candlesticks for multiple markets' do
      tickers = %w[KX-MARKET-1 KX-MARKET-2]
      series_ticker = 'KX-SERIES'
      start_ts = 1_600_000_000
      end_ts = 1_600_000_060
      period_interval = 1

      stub_request(:get, "#{base_url}/markets/candlesticks")
        .with(query: {
                market_tickers: tickers.join(','),
                series_ticker: series_ticker,
                start_ts: start_ts,
                end_ts: end_ts,
                period_interval: period_interval
              })
        .to_return(status: 200, body: '{"markets": []}', headers: { 'Content-Type' => 'application/json' })

      response = candlesticks.batch(
        tickers: tickers,
        series_ticker: series_ticker,
        start_ts: start_ts,
        end_ts: end_ts,
        period_interval: period_interval
      )

      assert_equal({ markets: [] }, response)
    end

    it 'handles single ticker string in batch' do
      tickers = 'KX-MARKET-1'
      series_ticker = 'KX-SERIES'
      start_ts = 1_600_000_000
      end_ts = 1_600_000_060
      period_interval = 1

      stub_request(:get, "#{base_url}/markets/candlesticks")
        .with(query: {
                market_tickers: tickers,
                series_ticker: series_ticker,
                start_ts: start_ts,
                end_ts: end_ts,
                period_interval: period_interval
              })
        .to_return(status: 200, body: '{"markets": []}', headers: { 'Content-Type' => 'application/json' })

      response = candlesticks.batch(
        tickers: tickers,
        series_ticker: series_ticker,
        start_ts: start_ts,
        end_ts: end_ts,
        period_interval: period_interval
      )

      assert_equal({ markets: [] }, response)
    end
  end
end
