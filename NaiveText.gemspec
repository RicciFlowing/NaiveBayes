# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'NaiveText/version'

Gem::Specification.new do |spec|
  spec.name          = "NaiveText"
  spec.version       = NaiveText::VERSION
  spec.authors       = ["RicciFlowing"]
  spec.email         = ["benjamin@mathe-sellin.de"]

  spec.summary       = "A text classifier written in ruby"
  spec.description   = "NaiveText is a text classifier gem written in ruby and made to be easily integratable in your Rails app."
  spec.homepage      = "https://github.com/RicciFlowing/NaiveText"
  spec.licenses    = ['MIT']

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  end

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-rubocop"
end
