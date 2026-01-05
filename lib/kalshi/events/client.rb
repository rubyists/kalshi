# frozen_string_literal: true

module Rubyists
  module Kalshi
    module Events
      # Events API Client
      class Client < ApiClient
        def list(...)
          List.new(client).list(...)
        end

        def fetch(...)
          List.new(client).fetch(...)
        end

        def metadata(...)
          List.new(client).metadata(...)
        end

        def multivariate
          Multivariate.new(client)
        end
      end
    end
  end
end
