# frozen_string_literal: true

require_relative '../helper'

describe Rubyists::Kalshi::Contract do
  # rubocop:disable Lint/ConstantDefinitionInBlock
  class TestContract < Rubyists::Kalshi::Contract
    property :existing_prop
    propertize :new_prop
  end
  # rubocop:enable Lint/ConstantDefinitionInBlock

  it 'handles existing definitions' do
    # This test just ensures the class definition above runs and exercises the code path
    assert_includes TestContract::Properties.members, :existing_prop
    assert_includes TestContract::Properties.members, :new_prop
  end
end
