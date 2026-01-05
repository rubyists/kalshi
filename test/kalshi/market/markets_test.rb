# frozen_string_literal: true

require_relative '../../helper'

describe Rubyists::Kalshi::Market::Markets do
  let(:client) { Rubyists::Kalshi::Client.new }
  let(:markets) { Rubyists::Kalshi::Market::Markets.new(client) }
  let(:base_url) { Rubyists::Kalshi.config.base_url }

  describe '#list' do
    it 'fetches the markets list' do
      stub_request(:get, "#{base_url}/markets")
        .to_return(status: 200, body: '{"markets": []}', headers: { 'Content-Type' => 'application/json' })

      response = markets.list

      assert_equal({ markets: [] }, response)
    end

    it 'fetches the markets list with filters' do
      stub_request(:get, "#{base_url}/markets")
        .with(query: { status: 'open' })
        .to_return(status: 200, body: '{"markets": []}', headers: { 'Content-Type' => 'application/json' })

      response = markets.list(status: 'open')

      assert_equal({ markets: [] }, response)
    end
  end

  describe '#fetch' do
    it 'fetches a specific market by ticker' do
      ticker = 'KX-MARKET'
      stub_request(:get, "#{base_url}/markets/#{ticker}")
        .to_return(status: 200, body: '{"market": {}}', headers: { 'Content-Type' => 'application/json' })

      response = markets.fetch(ticker)

      assert_equal({ market: {} }, response)
    end
  end
end
