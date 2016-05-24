# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'govuk_healthcheck/version'

Gem::Specification.new do |spec|
  spec.name          = "govuk_healthcheck"
  spec.version       = GovukHealthcheck::VERSION.dup
  spec.authors       = ["GOV.UK Dev"]
  spec.email         = ["govuk-dev@digital.cabinet-office.gov.uk"]
  spec.summary       = "Provides healthcheck info for a GOV.UK application"
  spec.description   = "Provides healthcheck info for a GOV.UK application"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "govuk-lint", "~> 1.1"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
end
