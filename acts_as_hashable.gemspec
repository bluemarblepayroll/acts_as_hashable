# frozen_string_literal: true

require './lib/acts_as_hashable/version'

Gem::Specification.new do |s|
  s.name        = 'acts_as_hashable'
  s.version     = ActsAsHashable::VERSION
  s.summary     = 'Simple hash-based factory methods for objects.'

  s.description = <<-DESCRIPTION
    This is a small library that helps increase the pliability of object constructor signatures.
    Instead of instantiating via the constructor, this library can install helper factory
    class-level methods that you can use with hashes.
  DESCRIPTION

  s.authors     = ['Matthew Ruggio']
  s.email       = ['mruggio@bluemarblepayroll.com']
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.homepage    = 'https://github.com/bluemarblepayroll/acts_as_hashable'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 2.3.8'

  s.add_development_dependency('guard-rspec', '~>4.7')
  s.add_development_dependency('pry')
  s.add_development_dependency('pry-byebug', '~> 3')
  s.add_development_dependency('rake', '~> 13.0')
  s.add_development_dependency('rspec')
  s.add_development_dependency('rubocop', '~> 0.63.1')
  s.add_development_dependency('simplecov', '~>0.16.1')
  s.add_development_dependency('simplecov-console', '~>0.4.2')
end
