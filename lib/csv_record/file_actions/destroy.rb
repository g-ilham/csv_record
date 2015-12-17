require "#{File.dirname(__FILE__) + '/base.rb'}"

module CsvRecord
  module FileActions
    class Destroy < CsvRecord::FileActions::Base
      def destroy
        set_existing_csv
        find_record
        puts "found_record  #{found_record}"
        puts "found_record class  #{found_record.class}"

      end
    end
  end
end
