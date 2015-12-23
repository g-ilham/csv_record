class Customer
  include CsvRecord::ActsAsCsvRecord

  acts_as_csv_record

  attr_reader :id,
              :first_name,
              :last_name

  def initialize(attrs)
    attrs.each do |k, v|
      self.public_send("#{k}=", v)
    end
  end
end
