module CsvRecord
  module InstanceMethods
    def destroy
      CsvRecord::Persistance::Destroy.new(self).run
    end
  end
end
