# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'datepicker_508/version'

Gem::Specification.new do |spec|
  spec.name          = "datepicker_508"
  spec.version       = Datepicker508::VERSION
  spec.authors       = ["Adam Freemer"]
  spec.email         = ["adam@freemer.com"]

  spec.summary       = "A 508 compliant datepicker"
  # spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = 'http://rubygems.org/gems/datepicker_508'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
