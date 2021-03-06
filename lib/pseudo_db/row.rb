require_relative 'data_generator'
require_relative 'data_dictionary'
require_relative 'logging'

require 'faker'

module PseudoDb
  class Row
    include Logging

    def initialize(row, table, data_dictionary)
      @row = row
      @table = table
      @data_dictionary = data_dictionary
    end

    def anonymize
      @data_dictionary.entries.each do |entry, properties|
        if entry.is_a?(String) && entry.split('.').size == 2
          field_to_update = entry.split('.').last.to_sym
          anonymize_field(field_to_update, properties)
        else
          valid_names = [entry]
          valid_names = valid_names.concat(properties[:aliases]) if properties[:aliases]
          (@row.keys & valid_names).each do |field_to_update|
            anonymize_field(field_to_update, properties)
          end
        end
      end

      @row
    end

    private

    def anonymize_field(field_to_update, properties)
      return if @row[field_to_update].nil? || @row[field_to_update].empty?
      randomised_value = randomize_value(properties, @row[field_to_update])
      logger.debug "Setting #{field_to_update} from #{@row[field_to_update]} to #{randomised_value}"
      @row[field_to_update] = randomised_value
    end

    def randomize_value(properties, current_value)
      if properties[:values].is_a?(Proc)
        return properties[:values].call(current_value)
      else
        return properties[:values].sample
      end
    end
  end
end