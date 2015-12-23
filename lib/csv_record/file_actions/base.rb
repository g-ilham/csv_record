require "csv"

module CsvRecord
  module FileActions
    class Base
      MAX_ROWS = 500

      CSV_SETTINGS = {
        headers: true,
        header_converters: :symbol
      }

      attr_reader :target_class,
                  :path,
                  :existing_file,
                  :target_instance,
                  :found_record_csv_index

      attr_accessor :id,
                    :attrs,
                    :found_record

      def initialize(target_class, attrs={}, target_instance=nil)
        @target_class = target_class
        self.id = target_instance.id if target_instance.present?
        self.attrs = attrs
        @path = "#{Rails.root}/db/#{csv_table_name}.csv"

        validate!
      end

      private

      def csv_table_name
        target_class.name.downcase.pluralize
      end

      def set_existing_csv
        begin
          @existing_file = CSV.read(path, CSV_SETTINGS)
        rescue
          raise connection_error, "#{csv_table_name.capitalize} table does't exist"
        end
      end

      def csv_headers
        existing_file.headers
      end

      def find_record
        detect_record
        raise existence_error, "Record with id #{id} not exist" unless found_record
      end

      def detect_record
        existing_file.each_with_index do |record, index|
          if record[:id].to_s == id.to_s
            @found_record = record
            @found_record_csv_index = index
          end
        end
      end

      def overwrite_table!
        ::File.open(path, 'w') do |f|
          f.write(existing_file.to_csv)
        end
      end

      def validate!
        if attrs.is_a?(Hash)
          check_keys(attrs.keys.map(&:to_sym))
        else
          raise attributes_error, "Attributes are not Hash"
        end
      end

      def check_keys(attrs_keys)
        if keys_in_hash_not_valid?(attrs_keys)
          raise attributes_error,
                "Bad attributes, the number of keys is greater than #{MAX_ROWS} or contains the key id"
        end
      end

      def keys_in_hash_not_valid?(attrs_keys)
        attrs_keys.size > MAX_ROWS ||
        attrs_keys.include?(:id)
      end

      def attributes_error
        CsvRecord::Exceptions::AttributesError
      end

      def connection_error
        CsvRecord::Exceptions::ConnectionError
      end

      def existence_error
        CsvRecord::Exceptions::ExistenceError
      end
    end
  end
end
