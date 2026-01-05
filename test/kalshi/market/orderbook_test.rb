# frozen_string_literal: true

require_relative '../../helper'

describe Rubyists::Kalshi::Market::Orderbook do
  let(:client) { Rubyists::Kalshi::Client.new }
  let(:orderbook) { Rubyists::Kalshi::Market::Orderbook.new(client) }
  let(:base_url) { Rubyists::Kalshi.config.base_url }

  describe '#fetch' do
    it 'fetches the orderbook for a market' do
      ticker = 'KX-MARKET'
      stub_request(:get, "#{base_url}/markets/#{ticker}/orderbook")
        .to_return(status: 200, body: '{"orderbook": {}}', headers: { 'Content-Type' => 'application/json' })

      response = orderbook.fetch(ticker)

      assert_equal({ orderbook: {} }, response)
    end

    it 'fetches the orderbook with depth' do
      ticker = 'KX-MARKET'
      stub_request(:get, "#{base_url}/markets/#{ticker}/orderbook")
        .with(query: { depth: 10 })
        .to_return(status: 200, body: '{"orderbook": {}}', headers: { 'Content-Type' => 'application/json' })

      response = orderbook.fetch(ticker, depth: 10)

      assert_equal({ orderbook: {} }, response)
    end
  end
end
