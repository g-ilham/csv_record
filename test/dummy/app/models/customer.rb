class Customer
  include CsvRecord::ActsAsCsvRecord

  acts_as_csv_record
end
