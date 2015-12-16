module CsvRecord
  module Persistance
    class Create
      attr_accessor :target_class,
                    :attrs,
                    :csv_manager

      def initialize(target_class, attrs={})
        self.target_class = target_class
        self.attrs = attrs
        self.csv_manager = CsvRecord::FileActions::Create.new(target_class, attrs)
      end

      def run
        csv_manager.create
      end
    end
  end
end