# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "split_with_display_width/version"

Gem::Specification.new do |spec|
  spec.name          = "split_with_display_width"
  spec.version       = SplitWithDisplayWidth::VERSION
  spec.authors       = ["nyaahara"]
  spec.email         = ["d.niihara@gmail.com"]

  spec.summary       = %q{monkey patch for split with display length to two strings}
  spec.description   = %q{monkey patch for split with display length to two strings}
  spec.homepage      = 'https://github.com/nyaahara/split_with_display_width'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.add_dependency "unicode-display_width", "~> 0.1"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
