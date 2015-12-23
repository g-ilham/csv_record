module CsvRecord
  module ClassMethods
    def create(attrs)
      CsvRecord::Persistance::Create.new(self, attrs).run
    end

    def all
      CsvRecord::FileActions::Finder.new(self).all
    end

    def first
      CsvRecord::FileActions::Finder.new(self).first
    end

    def last
      CsvRecord::FileActions::Finder.new(self).last
    end

    def find(id)
      CsvRecord::FileActions::Finder.new(self).find(id)
    end
  end
end
