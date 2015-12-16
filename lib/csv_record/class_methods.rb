module CsvRecord
  module ClassMethods
    def create(attrs)
      CsvRecord::Persistance::Create.new(self, attrs).run
    end
  end
end
