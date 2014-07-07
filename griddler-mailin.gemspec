# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'griddler/mailin/version'

Gem::Specification.new do |spec|
  spec.name          = 'griddler-mailin'
  spec.version       = Griddler::Mailin::VERSION
  spec.authors       = ['Robert Guthrie']
  spec.email         = ['rob@guthr.ie']
  spec.summary       = 'Mailin adapter for Griddler'
  spec.description   = 'Adapter to allow the use of Mailin (http://mailin.io/) with Griddler'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'activesupport'

  spec.add_dependency 'griddler'
end
