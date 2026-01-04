# frozen_string_literal: true

require_relative '../../helper'

describe Rubyists::Kalshi::Market::SeriesList do
  let(:client) { Rubyists::Kalshi::Client.new }
  let(:series_list) { Rubyists::Kalshi::Market::SeriesList.new(client) }
  let(:base_url) { Rubyists::Kalshi.config.base_url }

  describe '#list' do
    it 'fetches the series list' do
      stub_request(:get, "#{base_url}/series")
        .to_return(status: 200, body: '{"series": []}', headers: { 'Content-Type' => 'application/json' })

      response = series_list.list

      assert_equal({ series: [] }, response)
    end

    it 'fetches the series list with filters' do
      stub_request(:get, "#{base_url}/series")
        .with(query: { category: 'Politics' })
        .to_return(status: 200, body: '{"series": []}', headers: { 'Content-Type' => 'application/json' })

      response = series_list.list(category: 'Politics')

      assert_equal({ series: [] }, response)
    end

    it 'raises ArgumentError for invalid filters' do
      assert_raises(ArgumentError) do
        series_list.list(invalid_param: 'value')
      end
    end

    it 'allows calling list on the class' do
      stub_request(:get, "#{base_url}/series")
        .to_return(status: 200, body: '{"series": []}', headers: { 'Content-Type' => 'application/json' })

      response = Rubyists::Kalshi::Market::SeriesList.list

      assert_equal({ series: [] }, response)
    end
  end
end
