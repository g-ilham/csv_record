module CsvRecord
  module Readers
    class Base
      class << self
        def all(target_class)
          CsvRecord::FileActions::Finder.new(target_class).all
        end
      end
    end
  end
end
