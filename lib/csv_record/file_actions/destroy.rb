require "#{File.dirname(__FILE__) + '/base.rb'}"

module CsvRecord
  module FileActions
    class Destroy < CsvRecord::FileActions::Base
      def destroy
        set_existing_csv
        find_record
        existing_file.delete(found_record_csv_index)
        overwrite_table!

        true # return true once destroyed and not errored
      end
    end
  end
end
