module CsvRecord
  module Persistance
    class Destroy
      attr_reader :target_instance,
                  :target_class,
                  :csv_manager

      def initialize(target_instance)
        @target_instance = target_instance
        @target_class = target_instance.class
        @csv_manager = CsvRecord::FileActions::Destroy.new(target_class, {}, target_instance)
      end

      def run
        csv_manager.destroy
      end
    end
  end
end
