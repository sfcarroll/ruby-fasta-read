# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fasta_read/version'

Gem::Specification.new do |spec|
  spec.name          = "fasta_read"
  spec.version       = FastaRead::VERSION
  spec.authors       = ["Andrea D'Amico"]
  spec.email         = ["andrea.damico@gmail.com"]
  spec.summary       = %q{Fasta sequence extracter}
  spec.description   = %q{Extract DNA Fasta sequence from assembly files.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency('rake', '~> 0.9.2')
  spec.add_dependency('methadone', '~> 1.3.2')
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_development_dependency('rspec')
end
