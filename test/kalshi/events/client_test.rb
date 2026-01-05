# frozen_string_literal: true

require_relative '../../helper'

describe Rubyists::Kalshi::Events::Client do
  let(:client) { Rubyists::Kalshi::Client.new }
  let(:events_client) { client.events }
  let(:base_url) { Rubyists::Kalshi.config.base_url }

  describe '#list' do
    it 'fetches the events list' do
      stub_request(:get, "#{base_url}/events")
        .to_return(status: 200, body: '{"events": []}', headers: { 'Content-Type' => 'application/json' })

      response = events_client.list

      assert_equal({ events: [] }, response)
    end
  end

  describe '#fetch' do
    it 'fetches a specific event by ticker' do
      ticker = 'KX-EVENT'
      stub_request(:get, "#{base_url}/events/#{ticker}")
        .to_return(status: 200, body: '{"event": {}}', headers: { 'Content-Type' => 'application/json' })

      response = events_client.fetch(ticker)

      assert_equal({ event: {} }, response)
    end
  end

  describe '#metadata' do
    it 'fetches event metadata' do
      ticker = 'KX-EVENT'
      stub_request(:get, "#{base_url}/events/#{ticker}/metadata")
        .to_return(status: 200, body: '{"metadata": {}}', headers: { 'Content-Type' => 'application/json' })

      response = events_client.metadata(ticker)

      assert_equal({ metadata: {} }, response)
    end
  end

  describe '#multivariate' do
    it 'returns a Multivariate instance' do
      assert_instance_of Rubyists::Kalshi::Events::Multivariate, events_client.multivariate
    end
  end
end
