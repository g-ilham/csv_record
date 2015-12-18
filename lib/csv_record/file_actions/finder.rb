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
    end
  end
end
