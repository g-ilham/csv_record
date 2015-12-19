module CsvRecord
  module ActsAsCsvRecord
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_csv_record(options = {})
        extend CsvRecord::ClassMethods
        include CsvRecord::InstanceMethods
      end
    end
  end
end
