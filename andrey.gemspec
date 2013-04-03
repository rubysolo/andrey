# -*- encoding: utf-8 -*-
require File.expand_path('../lib/andrey/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Solomon White"]
  gem.email         = ["rubysolo@gmail.com"]
  gem.description   = %q{andrey}
  gem.summary       = %q{generate pseudopronounceable random words based on bigram freqency distribution}
  gem.homepage      = "https://github.com/rubysolo/andrey"

  gem.add_development_dependency 'mocha'
  gem.add_development_dependency 'rake'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "andrey"
  gem.require_paths = ["lib"]
  gem.version       = Andrey::VERSION
end
