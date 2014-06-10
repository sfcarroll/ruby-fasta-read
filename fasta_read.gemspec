# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fasta_read/version'

Gem::Specification.new do |spec|
  spec.name          = "bio_fasta_read"
  spec.version       = FastaRead::VERSION
  spec.authors       = ["Sean Carroll"]
  spec.email         = ["andrea.damico@gmail.com", "sfcarroll@gmail.com"]
  spec.summary       = %q{Fasta sequence extracter}
  spec.description   = %q{Extract DNA Fasta sequence from assembly files.}
  spec.homepage      = "https://github.com/sfcarroll/bio-fasta-read"

  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'methadone', '>= 1.3.2'
  spec.add_runtime_dependency 'rake', '>= 0.9.2'
  spec.add_development_dependency 'aruba', '>= 0.5.4'
  spec.add_development_dependency 'rspec', '>= 2.14.1'
  spec.add_development_dependency "guard-cucumber", '>= 1.4.1'
  spec.add_development_dependency "guard-rspec", '>= 4.2.8'
end
