module CsvRecord
  module Exceptions
    class AttributesError < ArgumentError
      def initialize(message)
        super
      end
    end

    class ConnectionError < IOError
      def initialize(message)
        super
      end
    end

    class ExistenceError < StandardError
      def initialize(message)
        super
      end
    end
  end
end
