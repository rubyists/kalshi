# frozen_string_literal: true

require_relative '../../helper'

describe Rubyists::Kalshi::Market::Trades do
  let(:client) { Rubyists::Kalshi::Client.new }
  let(:trades) { Rubyists::Kalshi::Market::Trades.new(client) }
  let(:base_url) { Rubyists::Kalshi.config.base_url }

  describe '#list' do
    it 'fetches the trades list' do
      stub_request(:get, "#{base_url}/markets/trades")
        .to_return(status: 200, body: '{"trades": []}', headers: { 'Content-Type' => 'application/json' })

      response = trades.list

      assert_equal({ trades: [] }, response)
    end

    it 'fetches the trades list with filters' do
      stub_request(:get, "#{base_url}/markets/trades")
        .with(query: { ticker: 'KX-MARKET' })
        .to_return(status: 200, body: '{"trades": []}', headers: { 'Content-Type' => 'application/json' })

      response = trades.list(ticker: 'KX-MARKET')

      assert_equal({ trades: [] }, response)
    end
  end
end
