require 'sequel'
require_relative 'row'

module PseudoDb
  class Database
    include Logging

    def initialize(sequel_connection, data_dictionary, dry_run = false)
      @database = sequel_connection
      @data_dictionary = data_dictionary
      @dry_run = dry_run

      logger.warn 'Running in "dry-run" mode, database will not be updated' if dry_run
    end

    def anonymize
      @database.tables.each do |table_name|
        #next unless table_name == :borrower_companies

        table = @database[table_name]
        table_schema = @database.schema(table)
        columns = table_schema.map { |row| row[0] }

        next unless @data_dictionary.entry_for_table?(table_name, columns)

        logger.debug "Anonymizing #{table_name}"

        table.all.each do |row|
          updateable_row = table.where(*row)
          row_anonymizer = Row.new(row, table_name, @data_dictionary)
          anonymized_data = row_anonymizer.anonymize
          updateable_row.update(**anonymized_data) unless @dry_run
        end
      end
    end
  end
end