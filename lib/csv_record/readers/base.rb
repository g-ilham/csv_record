module CsvRecord
  module Readers
    class Base
      class << self
        def all(target_class)
          csv_manager(target_class).all
        end

        def first(target_class)
          csv_manager(target_class).first
        end

        def csv_manager(target_class)
          CsvRecord::FileActions::Finder.new(target_class)
        end
      end
    end
  end
end
