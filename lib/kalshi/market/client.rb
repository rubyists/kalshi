# frozen_string_literal: true

module Rubyists
  module Kalshi
    module Market
      # Market API Client
      class Client
        attr_reader :client

        def initialize(client)
          @client = client
        end

        def series_list
          @series_list ||= SeriesList.new(client)
        end

        def series
          @series ||= Series.new(client)
        end
      end
    end
  end
end
