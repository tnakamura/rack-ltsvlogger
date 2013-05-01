# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/ltsvlogger/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-ltsvlogger"
  spec.version       = Rack::LTSVLogger::VERSION
  spec.authors       = ["tnakamura"]
  spec.email         = ["griefworker@gmail.com"]
  spec.description   = %q{LTSV logger for Rack applications implemented as middleware}
  spec.summary       = %q{LTSV logger for Rack applications implemented as middleware}
  spec.homepage      = "https://github.com/tnakamura/rack-ltsvlogger"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rack-test"
  spec.add_runtime_dependency "rack"
end
