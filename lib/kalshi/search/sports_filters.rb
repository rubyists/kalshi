# frozen_string_literal: true

module Rubyists
  module Kalshi
    module Search
      # Sports Filters API endpoint
      class SportsFilters < Kalshi::Endpoint
        def all
          client.get('filters_by_sport')
        end
      end
    end
  end
end
