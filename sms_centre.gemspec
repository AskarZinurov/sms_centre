# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sms_centre/version"

Gem::Specification.new do |s|
  s.name        = "sms_centre"
  s.version     = SmsCentre::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Askar Zinurov"]
  s.email       = ["askar.zinurov@itspark.ru"]
  s.homepage    = "https://github.com/AskarZinurov/sms_centre"
  s.summary     = %q{Sms Centre client gem}
  s.description = %q{Gem for working with SmsCentre sms gateway}

  s.rubyforge_project = "sms_centre"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", "~> 2.6.0"
  s.add_runtime_dependency 'httparty', '~> 0.6.1'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
