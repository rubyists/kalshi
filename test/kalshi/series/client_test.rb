# frozen_string_literal: true

require_relative '../../helper'

describe Rubyists::Kalshi::Series::Client do
  let(:client) { Rubyists::Kalshi::Client.new }
  let(:series_client) { client.series }
  let(:base_url) { Rubyists::Kalshi.config.base_url }

  describe '#event_candlesticks' do
    it 'returns a EventCandlesticks instance' do
      assert_instance_of Rubyists::Kalshi::Series::EventCandlesticks, series_client.event_candlesticks
    end
  end

  describe '#forecast_percentile_history' do
    it 'returns a ForecastPercentileHistory instance' do
      assert_instance_of Rubyists::Kalshi::Series::ForecastPercentileHistory, series_client.forecast_percentile_history
    end
  end
end
