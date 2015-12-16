require "csv"

module CsvRecord
  module FileActions
    class Base
      MAX_ROWS = 500

      attr_accessor :target_class,
                    :path,
                    :attrs

      def initialize(target_class, attrs={})
        self.target_class = target_class
        self.attrs = attrs
        self.path = "#{Rails.root}/db/#{target_class.name.downcase.pluralize}.csv"

        validate!
      end

      private

      def validate!
        if attrs.is_a?(Hash)
          check_keys(attrs.keys.map(&:to_sym))
        else
          raise "Bad attributes"
        end
      end

      def check_keys(attrs_keys)
        if keys_in_hash_not_valid?(attrs_keys)
          raise "Bad attributes: the number of keys is large or contains the key id"
        end
      end

      def keys_in_hash_not_valid?(attrs_keys)
        attrs_keys.size > MAX_ROWS ||
        attrs_keys.include?(:id)
      end
    end
  end
end
