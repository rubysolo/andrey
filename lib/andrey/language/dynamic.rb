module Andrey
  module Language
    class Dynamic
      attr_reader :symbols, :probability_map

      def initialize(symbols, map)
        @symbols = symbols
        @probability_map = map
      end
    end
  end
end
