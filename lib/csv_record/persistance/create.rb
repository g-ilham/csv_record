module CsvRecord
  module Persistance
    class Create
      attr_accessor :target_class,
                    :attrs

      def initialize(target_class, attrs={})
        self.target_class = target_class
        self.attrs = attrs
      end

      def run
        puts "create ----#{target_class} #{attrs} "
      end
    end
  end
end
