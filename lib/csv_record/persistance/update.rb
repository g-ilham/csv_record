module CsvRecord
  module Persistance
    class Update
      attr_accessor :target_class,
                    :target_instance,
                    :attrs,
                    :csv_manager

      def initialize(target_instance, attrs={})
        self.target_instance = target_instance
        self.target_class = target_instance.class
        self.attrs = attrs

        self.csv_manager = CsvRecord::FileActions::Update.new(target_class,
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
