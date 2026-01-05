# frozen_string_literal: true

require_relative '../helper'

describe Rubyists::Kalshi::Client do
  let(:base_url) { Rubyists::Kalshi.config.base_url }

  describe '#get' do
    it 'raises Error on API error' do
      stub_request(:get, "#{base_url}/error")
        .to_return(status: 400, body: 'Bad Request')

      client = Rubyists::Kalshi::Client.new
      error = assert_raises(Rubyists::Kalshi::Error) do
        client.get('error')
      end
      assert_match(/API Error: 400 - Bad Request/, error.message)
    end
  end

  describe '#get_url' do
    it 'fetches from a full URL' do
      url = 'https://example.com/api/resource'
      stub_request(:get, url)
        .to_return(status: 200, body: '{"data": "value"}', headers: { 'Content-Type' => 'application/json' })

      client = Rubyists::Kalshi::Client.new
      response = client.get_url(url)

      assert_equal({ data: 'value' }, response)
    end

    it 'raises Error for invalid URL scheme' do
      client = Rubyists::Kalshi::Client.new
      error = assert_raises(Rubyists::Kalshi::Error) do
        client.get_url('ftp://example.com')
      end
      assert_match(/Invalid URL/, error.message)
    end

    it 'raises Error for invalid URL format' do
      client = Rubyists::Kalshi::Client.new
      error = assert_raises(Rubyists::Kalshi::Error) do
        client.get_url('not_a_url')
      end
      assert_match(/Invalid URL/, error.message)
    end
  end

  describe '#market' do
    it 'returns a Market::Client instance' do
      client = Rubyists::Kalshi::Client.new

      assert_instance_of Rubyists::Kalshi::Market::Client, client.market
    end
  end

  describe '#search' do
    it 'returns a Search::Client instance' do
      client = Rubyists::Kalshi::Client.new

      assert_instance_of Rubyists::Kalshi::Search::Client, client.search
    end
  end
end

describe Rubyists::Kalshi do
  describe '.client' do
    it 'returns a client instance' do
      assert_instance_of Rubyists::Kalshi::Client, Rubyists::Kalshi.client
    end

    it 'returns the same instance' do
      assert_same Rubyists::Kalshi.client, Rubyists::Kalshi.client
    end
  end
end
