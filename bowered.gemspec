# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bowered/version'

Gem::Specification.new do |spec|
  spec.name          = "bowered"
  spec.version       = Bowered::VERSION
  spec.authors       = ["Adam Stankiewicz"]
  spec.email         = ["sheerun@sher.pl"]
  spec.summary       = %q{Bower client that integrates with Sprockets}
  spec.homepage      = "https://github.com/bowered/bowered"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
