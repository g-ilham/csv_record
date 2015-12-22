require "#{File.dirname(__FILE__) + '/base.rb'}"

module CsvRecord
  module FileActions
    class Update < CsvRecord::FileActions::Base
      def update
        set_existing_csv
        update_record!
        overwrite_table!

        found_record
      end

      private

      def update_record!
        find_record

        attrs.each do |key, value|
          self.found_record[key.to_sym] = value
        end
      end
    end
  end
end
