module CsvRecord
  module ClassMethods
    def create(attrs)
      CsvRecord::Persistance::Create.new(self, attrs).run
    end

    def all
      CsvRecord::Readers::Base.all(self)
    end
  end
end
