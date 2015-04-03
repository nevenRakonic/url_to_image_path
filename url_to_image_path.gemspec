# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'url_to_image_path/version'

Gem::Specification.new do |spec|
  spec.name          = "url_to_image_path"
  spec.version       = UrlToImagePath::VERSION
  spec.authors       = ["Neven Rakonić"]
  spec.email         = ["neven.rakonic@gmail.com"]

  spec.summary       = %q{Change URLs in your css to rails helper_methods}
  spec.description   = %q{Change URLs in your css to rails helper_methods}
  spec.homepage      = "https://github.com/nevenRakonic/url_to_image_path"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
