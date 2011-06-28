# -*- encoding: utf-8 -*-
require File.expand_path('../lib/validatious/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Joel Moss"]
  gem.email         = ["joel@developwithstyle.com"]
  gem.description   = %q{A collection of delicious Rails validators}
  gem.summary       = %q{A collection of delicious Rails validators}
  gem.homepage      = 'https://github.com/joelmoss/validatious'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "validatious"
  gem.require_paths = ['lib']
  gem.version       = Validatious::VERSION
  
  gem.add_dependency 'activemodel'
  
  gem.add_development_dependency "rspec"
end
