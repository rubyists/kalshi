# frozen_string_literal: true

require_relative '../../helper'

describe Rubyists::Kalshi::Events::Multivariate do
  let(:client) { Rubyists::Kalshi::Client.new }
  let(:multivariate) { client.events.multivariate }
  let(:base_url) { Rubyists::Kalshi.config.base_url }

  describe '#list' do
    it 'fetches the multivariate events list' do
      stub_request(:get, "#{base_url}/events/multivariate")
        .to_return(status: 200, body: '{"events": []}', headers: { 'Content-Type' => 'application/json' })

      response = multivariate.list

      assert_equal({ events: [] }, response)
    end

    it 'fetches the multivariate events list with filters' do
      stub_request(:get, "#{base_url}/events/multivariate")
        .with(query: { series_ticker: 'KX-SERIES' })
        .to_return(status: 200, body: '{"events": []}', headers: { 'Content-Type' => 'application/json' })

      response = multivariate.list(series_ticker: 'KX-SERIES')

      assert_equal({ events: [] }, response)
    end
  end
end
