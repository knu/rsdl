# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "rsdl"
  spec.version       = "0.1.5"
  spec.authors       = ["Ryuichi Sakamoto", "Akinori MUSHA"]
  spec.email         = ["knu@idaemons.org"]

  spec.summary       = %q{SDL initialized ruby interpreter}
  spec.description   = <<EOS
RSDL is an SDL initialized ruby interpreter which makes SDL
applications possible to run on such platforms as Mac OS X where SDL
needs to be initialized before a ruby interpreter is invoked.
EOS
  spec.homepage      = "https://github.com/knu/rsdl"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions    = ["extconf.rb"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
