module CsvRecord
  module InstanceMethods
    def destroy
      CsvRecord::Persistance::Destroy.new(self).run
    end

    def update(attrs)
      CsvRecord::Persistance::Update.new(self, attrs).run
    end
  end
end
