# frozen_string_literal: true

require_relative '../helper'

describe Rubyists::Kalshi::ApiClient do
  # rubocop:disable Lint/ConstantDefinitionInBlock
  class TestApiClient < Rubyists::Kalshi::ApiClient
  end
  # rubocop:enable Lint/ConstantDefinitionInBlock

  describe '.prefix=' do
    it 'sets the prefix' do
      TestApiClient.prefix = 'test'

      assert_equal 'test', TestApiClient.prefix
    end
  end
end
