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

  test "find" do
    clean_csv_file!
    create_collection!

    created_record = csv_entries.first

    found_record = Customer.find(created_record[:id])

    assert_equal first_name, found_record.first_name
    assert_equal last_name, found_record.last_name
  end

  test "update" do
    clean_csv_file!
    create_customer!(first_name, last_name)

    created_record = csv_entries.first

    found_record = Customer.find(created_record[:id])

    assert_equal first_name, found_record.first_name
    assert_equal last_name, found_record.last_name

    found_record.update(first_name: updated_name)

    updated_record = Customer.find(created_record[:id])

    assert_equal updated_name, updated_record.first_name
  end

  test "destroy" do
    clean_csv_file!
    create_customer!(first_name, last_name)

    created_record = csv_entries.first
    found_record = Customer.find(created_record[:id])

    found_record.destroy

    assert_raise Errno::ENOENT do
      Customer.find(created_record[:id])
    end
  end

  test "all" do
    clean_csv_file!
    create_collection!

    all_customers = Customer.all

    assert_equal 2, all_customers.count
    assert_equal first_name, all_customers.first.first_name
    assert_equal "Ilgis", all_customers.last.first_name
  end

  test "first" do
    clean_csv_file!
    create_collection!

    first_customer = Customer.first

    assert_equal first_name, first_customer.first_name
    assert_equal last_name, first_customer.last_name
  end

  test "last" do
    clean_csv_file!
    create_collection!

    last_customer = Customer.last

    assert_equal "Ilgis", last_customer.first_name
    assert_equal "Ibragimov", last_customer.last_name
  end

  def first_name
    "Ilgam"
  end

  def last_name
    "Gaysin"
  end

  def updated_name
    "Grisha"
  end

  def create_customer!(name, sur_name)
    Customer.create(first_name: name, last_name: sur_name)
  end

  def create_collection!
    create_customer!(first_name, last_name)
    create_customer!("Ilgis", "Ibragimov")
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
