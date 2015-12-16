module CsvRecord
  module ActsAsCsvRecord
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_csv_record(options = {})
      end
    end
  end
end
