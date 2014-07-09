# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shome/version'

Gem::Specification.new do |spec|
  spec.name          = "shome"
  spec.version       = Shome::VERSION
  spec.authors       = ["Justin Smestad"]
  spec.email         = ["justin.smestad@gmail.com"]
  spec.summary       = %q{Deployment configuration management for sandbox environments}
  spec.description   = %q{Deployment configuration management for sandbox environments}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "capistrano", ">= 3"
  spec.add_development_dependency "rails", ">= 3"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
