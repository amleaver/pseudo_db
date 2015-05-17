require 'deep_merge'
require_relative 'logging'

module PseudoDb
  class DataDictionary
    include Logging

    attr_reader :entries

    def initialize(custom_dictionary_path = nil, override = false)
      @entries = override ? {} : eval(File.read("#{File.dirname(__FILE__)}/default_dictionary.rb"))

      if custom_dictionary_path
        logger.info("Using custom dictionary '#{custom_dictionary_path}'")
        @entries.deep_merge!(eval(File.read(custom_dictionary_path)))
      end
    end

    def entry_for_table?(table_name, columns)
      fields = []

      entries.each do |field, property|
        if field.is_a?(String) && field.split('.').size == 2
          return true if table_name.to_s == field.split('.').first && columns.include?(field.split('.').last.to_sym)
        else
          fields << field
          next if property[:aliases].nil?
          property[:aliases].each do |field_alias|
            fields << field_alias
          end
        end
      end

      (fields & columns).count > 0
    end
  end
end