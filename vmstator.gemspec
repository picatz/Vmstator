# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vmstator/version'

Gem::Specification.new do |spec|
  spec.name          = "vmstator"
  spec.version       = Vmstator::VERSION
  spec.authors       = ["Kent 'picat' Gruber"]
  spec.email         = ["kgruber1@emich.edu"]

  spec.summary       = %q{Vmstator is a Ruby API for vmstat to monitor virtual memory statistics.}
  spec.description   = %q{Vmstator is a Ruby API for vmstat to monitor virtual memory statistics. It provides an OO interface to be able to parse the contents of the output of vmstat and access that infromation intuitively.}
  spec.homepage      = "https://github.com/picatz/Vmstator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
