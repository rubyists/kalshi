# frozen_string_literal: true

require_relative '../../helper'

describe Rubyists::Kalshi::Market::Client do
  let(:client) { Rubyists::Kalshi::Client.new }
  let(:market_client) { client.market }

  describe '#series_list' do
    it 'returns a SeriesList instance' do
      assert_instance_of Rubyists::Kalshi::Market::SeriesList, market_client.series_list
    end

    it 'memoizes the instance' do
      assert_same market_client.series_list, market_client.series_list
    end
  end

  describe '#series' do
    it 'returns a Series instance' do
      assert_instance_of Rubyists::Kalshi::Market::Series, market_client.series
    end

    it 'memoizes the instance' do
      assert_same market_client.series, market_client.series
    end
  end

  describe '#markets' do
    it 'returns a Markets instance' do
      assert_instance_of Rubyists::Kalshi::Market::Markets, market_client.markets
    end

    it 'memoizes the instance' do
      assert_same market_client.markets, market_client.markets
    end
  end

  describe '#orderbook' do
    it 'returns an Orderbook instance' do
      assert_instance_of Rubyists::Kalshi::Market::Orderbook, market_client.orderbook
    end

    it 'memoizes the instance' do
      assert_same market_client.orderbook, market_client.orderbook
    end
  end

  describe '#trades' do
    it 'returns a Trades instance' do
      assert_instance_of Rubyists::Kalshi::Market::Trades, market_client.trades
    end

    it 'memoizes the instance' do
      assert_same market_client.trades, market_client.trades
    end
  end

  describe '#candlesticks' do
    it 'returns a Candlesticks instance' do
      assert_instance_of Rubyists::Kalshi::Series::MarketCandlesticks, market_client.candlesticks
    end

    it 'memoizes the instance' do
      assert_same market_client.candlesticks, market_client.candlesticks
    end
  end
end
