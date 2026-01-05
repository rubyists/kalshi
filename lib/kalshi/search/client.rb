# frozen_string_literal: true

module Rubyists
  module Kalshi
    module Search
      # Search API Client
      class Client < ApiClient
        def tags_by_categories
          SeriesTags.new(client).all
        end

        def filters_by_sports
          SportsFilters.new(client).all
        end
      end
    end
  end
end
