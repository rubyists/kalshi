# frozen_string_literal: true

require 'helper'

module Kalshi
  class TestRb < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::Kalshi::Rb::VERSION
    end
  end
end
