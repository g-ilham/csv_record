module CsvRecord
  module Persistance
    class Create
      attr_reader :target_class,
                  :attrs,
                  :csv_manager

      def initialize(target_class, attrs={})
        @target_class = target_class
        @attrs = attrs
        @csv_manager = CsvRecord::FileActions::Create.new(target_class, attrs)
      end

      def run
        created_object_attrs = csv_manager.create
        target_class.new(created_object_attrs)
      end
    end
  end
end
