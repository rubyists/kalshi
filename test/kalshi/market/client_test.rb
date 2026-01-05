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
end
