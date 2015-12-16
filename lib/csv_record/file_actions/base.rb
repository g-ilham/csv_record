require "csv"

module CsvRecord
  module FileActions
    class Base
      attr_accessor :target_class,
                    :path,
                    :attrs

      def initialize(target_class, attrs={})
        self.target_class = target_class
        self.attrs = attrs
        self.path = "#{Rails.root}/db/#{target_class.name.downcase.pluralize}.csv"
      end
    end
  end
end
