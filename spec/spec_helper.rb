require 'rspec'
require_relative '../lib/pseudo_db/logging'

include PseudoDb::Logging

# requires all ruby files within the lib directory
Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each { |f| require f }

# disable log output in tests
logger.sev_threshold = Logger::FATAL