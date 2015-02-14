# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rake/namespace_group/version'

Gem::Specification.new do |spec|
  spec.name          = "rake-namespace_group"
  spec.version       = Rake::NamespaceGroup::VERSION
  spec.authors       = ["Jan Vansteenkiste"]
  spec.email         = ["jan@vstone.eu"]
  spec.summary       = %q{Provide an wrapper task for namespaces that executes all tasks.}
  spec.description   = %q{A namespace_group creates a task that loops over all tasks in the namespace.}
  spec.homepage      = "https://github.com/vStone/rake-namespace_group"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rake', '~> 10.0'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rspec', '~> 3.2'
end
