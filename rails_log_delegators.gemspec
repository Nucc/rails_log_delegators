# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_log_delegators/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_log_delegators"
  spec.version       = RailsLogDelegators::VERSION
  spec.authors       = ["Laszlo Papp"]
  spec.email         = ["lpapp@zendesk.com"]
  spec.summary       = %q{Delegates log methods to Rails.logger}
  spec.description   = %q{More comfortable way to write log messages}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "5.4.0"
end
