require "#{File.dirname(__FILE__) + '/base.rb'}"

module CsvRecord
  module FileActions
    class Create < CsvRecord::FileActions::Base
      def create
        puts "[ FileActions ] create!"
      end
    end
  end
end
