# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-zaimv2/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["maar4569"]
  gem.email         = ["maar4569@gmail.com"]
  gem.description   = %q{OmniAuth Zaim API V2.}
  gem.summary       = %q{OmniAuth Zaim API V2.}
  gem.homepage      = "https://github.com/maar4569/omniauth-zaimv2"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-zaimv2"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::ZaimV2::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth', '~>1.0'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
