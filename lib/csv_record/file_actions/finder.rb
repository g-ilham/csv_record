require "#{File.dirname(__FILE__) + '/base.rb'}"

module CsvRecord
  module FileActions
    class Finder < CsvRecord::FileActions::Base
      def all
        set_existing_csv

        existing_file.map do |csv_record|
          target_class.new(csv_record)
        end
      end

      def first
        set_existing_csv
        target_class.new(existing_file[0])
      end

      def last
        set_existing_csv
        last_item = existing_file[existing_file.size - 1]
        target_class.new(last_item)
      end

      def find(target_id)
        self.id = target_id
        set_existing_csv
        find_record

        target_class.new(found_record)
      end
    end
  end
end
