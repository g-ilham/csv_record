module CsvRecord
  module ClassMethods
    def create(attrs)
      CsvRecord::Persistance::Create.new(self, attrs).run
    end

    def all
      CsvRecord::Readers::Base.all(self)
    end

    def first
      CsvRecord::Readers::Base.first(self)
    end

    def last
      CsvRecord::Readers::Base.last(self)
    end

    def find(id)
      CsvRecord::Readers::Base.find(self, id)
    end
  end
end
