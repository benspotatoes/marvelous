# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'marvelous/version'

Gem::Specification.new do |spec|
  spec.name          = "marvelous"
  spec.version       = Marvelous::VERSION
  spec.authors       = ["Benjamin Hsieh, Ben's Potatoes"]
  spec.email         = ["benspotatoes@gmail.com"]
  spec.summary       = %q{Ruby library for Marvel API}
  spec.description   = %q{It's maaaahvelous!}
  spec.homepage      = "http://github.com/benspotatoes/histrionic-superhero"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "faraday", '~> 0.9', '>= 0.9.0'

  spec.required_ruby_version = '~> 2.0'
end
