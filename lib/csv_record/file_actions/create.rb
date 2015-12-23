require "#{File.dirname(__FILE__) + '/base.rb'}"

module CsvRecord
  module FileActions
    class Create < CsvRecord::FileActions::Base
      def create
        if ::File.exist?(path)
          add_record!
        else
          persist_record!("wb")
        end

        attrs
      end

      private

      def add_record!
        set_existing_csv
        match_attrs_with_persisted_on_csv_headers
        persist_record!("a+")
      end

      def match_attrs_with_persisted_on_csv_headers
        full_attrs = (attrs.keys.map(&:to_sym) << :id).sort

        if full_attrs != csv_headers.sort
          raise attributes_error, "Passed attributes and the attributes in the table do not match"
        end
      end

      def persist_record!(access_mode)
        CSV.open(path, access_mode) do |csv_iterator|
          write_record_in_csv_file(csv_iterator, access_mode)
        end
      end

      def write_record_in_csv_file(csv_iterator, access_mode)
        id = next_id(access_mode)

        csv_iterator << attrs.keys.map(&:to_s).unshift("id") if access_mode == 'wb'
        csv_iterator << attrs.values.map(&:to_s).unshift(id)

        self.attrs[:id] = id
      end

      def next_id(access_mode)
        if access_mode == "a+"
          ids = existing_file.values_at(:id).flatten
          sum_ids = ids.map(&:to_i).max + 1
        else
          1
        end.to_s
      end
    end
  end
end
