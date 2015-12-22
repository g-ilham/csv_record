module CsvRecord
  module Persistance
    class Update
      attr_reader :target_class,
                  :target_instance,
                  :attrs,
                  :csv_manager

      def initialize(target_instance, attrs={})
        @target_instance = target_instance
        @target_class = target_instance.class
        @attrs = attrs

        @csv_manager = CsvRecord::FileActions::Update.new(target_class,
                                                            attrs,
                                                            target_instance)
      end

      def run
        created_object_attrs = csv_manager.update
        target_class.new(created_object_attrs)
      end
    end
  end
end
