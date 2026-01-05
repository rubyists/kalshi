# frozen_string_literal: true

module Rubyists
  module Kalshi
    module Search
      # Series Tags API endpoint
      class SeriesTags < Kalshi::Endpoint
        def all
          client.get('search/tags_by_categories')
        end
      end
    end
  end
end
