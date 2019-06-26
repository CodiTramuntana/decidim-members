# frozen_string_literal: true

module Decidim
  module Members
    class FilteredMembers < Rectify::Query
      def self.for(query_string, scope)
        new(query_string, scope).query
      end

      def initialize(query_string, scope)
        @query_string = query_string
        @scope = scope
      end

      def query
        @scope.search_by_name_like(@query_string)
      end
    end
  end
end
