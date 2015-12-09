# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kusari/version'

Gem::Specification.new do |spec|
  spec.name          = "kusari"
  spec.version       = Kusari::VERSION
  spec.license       = "MIT"
  spec.authors       = ["takuti"]
  spec.email         = ["k.takuti@gmail.com"]

  spec.summary       = %q{Japanese random sentence generator based on Markov chain.}
  spec.homepage      = "https://github.com/takuti/kusari"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "igo-ruby", "~> 0.1.5"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
