# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parse_gemspec/constants'
require 'parse_gemspec/version'

Gem::Specification.new do |spec|
  spec.name          = 'parse_gemspec'
  spec.version       = ParseGemspec::VERSION
  spec.authors       = ['sanemat']
  spec.email         = ['o.gata.ken@gmail.com']

  spec.summary       =
    'Parse *.gemspec file. Convert to Ruby Hash object.'
  spec.description   =
    'Parse *.gemspec file. Convert to Ruby Hash object.'
  spec.homepage      = ParseGemspec::HOMEPAGE
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.0'

  spec.files         = `git ls-files -z`
    .split("\x0")
    .reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec
    .files
    .grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'test-unit'
end
