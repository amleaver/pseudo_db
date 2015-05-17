require 'Logger'

module PseudoDb
  module Logging
    def logger
      Logging.logger
    end

    def self.logger
      if @logger.nil?
        @logger = Logger.new(STDOUT)
        @logger.sev_threshold = Logger::ERROR
      end

      @logger
    end
  end
end