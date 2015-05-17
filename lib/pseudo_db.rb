require_relative "pseudo_db/version"
require_relative "pseudo_db/database"

module PseudoDb

  DEFAULTS = {
      adapter: 'mysql',
      user: nil,
      password: nil,
      host: 'localhost',
      database: 'test',
      dry_run: false,
      custom_dictionary: nil
  }

  def anonymize(options = {})
    options = DEFAULTS.merge(options)

    sequel_connection = Sequel.connect(
        :adapter => options[:adapter],
        :user => options[:user],
        :host => options[:host],
        :database => options[:database],
        :password => options[:password]
    )

    data_dictionary = DataDictionary.new(options[:custom_dictionary])
    db_anonymizer = Database.new(sequel_connection, data_dictionary, options[:dry_run])
    db_anonymizer.anonymize
  end
end
