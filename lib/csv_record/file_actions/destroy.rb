require "#{File.dirname(__FILE__) + '/base.rb'}"

module CsvRecord
  module FileActions
    class Destroy < CsvRecord::FileActions::Base
      def destroy
        set_existing_csv
        find_record
        existing_file.delete(found_record_csv_index)
        update_csv_data_or_delete_table

        true # return true once destroyed and not errored
      end

      private

      def update_csv_data_or_delete_table
        if existing_file.to_a.size > 1
          overwrite_table!
        else
          File.delete(path)
        end
      end
    end
  end
end
