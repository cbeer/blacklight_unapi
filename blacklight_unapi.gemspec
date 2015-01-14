 # -*- coding: utf-8 -*-
require File.join(File.dirname(__FILE__), "lib/blacklight_unapi/version")

Gem::Specification.new do |s|
  s.name = "blacklight_unapi"
  s.version = BlacklightUnapi::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Chris Beer"]
  s.email = ["chris@cbeer.info"]
  s.homepage    = "http://projectblacklight.org/"
  s.summary = "Blacklight unapi plugin"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]


  s.add_dependency "rails"
  s.add_dependency "blacklight", "~> 5.0"
  
  s.add_development_dependency "bundler", "~> 1.5"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec-rails", "~> 3.1"
  s.add_development_dependency "jettywrapper"
  s.add_development_dependency "engine_cart"
  s.add_development_dependency "capybara"
  s.add_development_dependency "poltergeist", ">= 1.5.0"
end

