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

        def last(target_class)
          csv_manager(target_class).last
        end

        def find(target_class, id)
          csv_manager(target_class).find(id)
        end

        def csv_manager(target_class)
          CsvRecord::FileActions::Finder.new(target_class)
        end
      end
    end
  end
end
