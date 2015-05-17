# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pseudo_db/version'

Gem::Specification.new do |spec|
  spec.name          = "pseudo_db"
  spec.version       = PseudoDb::VERSION
  spec.authors       = ["Alex Leaver"]
  spec.email         = ["email@alexleaver.co.uk"]

  spec.summary       = %q{Executable Gem for anonymizing the contents of a database}
  spec.homepage      = "https://github.com/amleaver/pseudo_db"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables << 'pseudo_db'
  spec.test_files    = spec.files.grep(%r{/^spec\//})
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
