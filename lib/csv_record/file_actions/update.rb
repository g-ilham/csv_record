require "#{File.dirname(__FILE__) + '/base.rb'}"

module CsvRecord
  module FileActions
    class Update < CsvRecord::FileActions::Base
      def update
        set_existing_csv
        update_record!
      end

      private

      def update_record!
        find_record

        attrs.each do |key, value|
          if csv_headers.include?(key.to_sym)
            self.found_record[key.to_sym] = value
          else
            raise "#{key} attribute is not present in table"
          end
        end
      end
    end
  end
end
