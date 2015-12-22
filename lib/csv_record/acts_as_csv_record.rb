module CsvRecord
  module ActsAsCsvRecord
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_csv_record(options = {})
        extend CsvRecord::ClassMethods
        include CsvRecord::InstanceMethods
        extend CsvRecord::Exceptions
      end
    end
  end
end
