# frozen_string_literal: true

require_relative '../../helper'

describe Rubyists::Kalshi::Search::Client do
  let(:client) { Rubyists::Kalshi::Client.new }
  let(:search_client) { client.search }
  let(:base_url) { Rubyists::Kalshi.config.base_url }

  describe '#tags_by_categories' do
    it 'fetches tags by categories' do
      stub_request(:get, "#{base_url}/search/tags_by_categories")
        .to_return(status: 200, body: '{"tags_by_categories": {}}', headers: { 'Content-Type' => 'application/json' })

      response = search_client.tags_by_categories

      assert_equal({ tags_by_categories: {} }, response)
    end
  end

  describe '#filters_by_sports' do
    it 'fetches filters by sports' do
      stub_request(:get, "#{base_url}/search/filters_by_sports")
        .to_return(status: 200, body: '{"filters_by_sports": {}}', headers: { 'Content-Type' => 'application/json' })

      response = search_client.filters_by_sports

      assert_equal({ filters_by_sports: {} }, response)
    end
  end
end
