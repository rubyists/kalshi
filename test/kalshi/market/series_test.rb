# frozen_string_literal: true

require_relative '../../helper'

describe Rubyists::Kalshi::Market::Series do
  let(:client) { Rubyists::Kalshi::Client.new }
  let(:series) { Rubyists::Kalshi::Market::Series.new(client) }
  let(:base_url) { Rubyists::Kalshi.config.base_url }

  describe '#fetch' do
    it 'fetches a specific series by ticker' do
      ticker = 'KX-SERIES'
      stub_request(:get, "#{base_url}/series/#{ticker}")
        .to_return(status: 200, body: '{"series": {}}', headers: { 'Content-Type' => 'application/json' })

      response = series.fetch(ticker)

      assert_equal({ series: {} }, response)
    end
  end
end
