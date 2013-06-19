# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'depsio/version'

Gem::Specification.new do |gem|
  gem.name          = "depsio"
  gem.version       = Depsio::VERSION
  gem.authors       = ["Alexandre Gerlic", "Jeremie Bordier"]
  gem.email         = ["contact@deps.io"]
  gem.description   = %q{Deps.io: Keep your project dependencies under control}
  gem.summary       = gem.description
  gem.homepage      = "http://github.com/letsdoapps/depsio-gem"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency("json")
  gem.add_runtime_dependency("rest-client")
end
