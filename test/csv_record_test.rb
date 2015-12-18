require 'test_helper'

class CsvRecordTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, CsvRecord
  end

  test "create" do
    clean_csv_file!
    create_customer!(first_name, last_name)

    assert_equal 1, csv_entries.count

    first_record = csv_entries.first

    assert_equal first_name, first_record[:first_name]
    assert_equal last_name, first_record[:last_name]
  end

  def first_name
    "Ilgam"
  end

  def last_name
    "Gaysin"
  end

  def create_customer!(name, sur_name)
    Customer.create(first_name: name, last_name: sur_name)
  end

  def path_to_file
    "#{Rails.root}/db/customers.csv"
  end

  def csv_entries
    CSV.read(path_to_file, CsvRecord::FileActions::Base::CSV_SETTINGS)
  end

  def clean_csv_file!
    File.delete(path_to_file) if File.exist?(path_to_file)
  end
end
