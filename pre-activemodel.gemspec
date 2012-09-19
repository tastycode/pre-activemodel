# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pre-activemodel/version"

Gem::Specification.new do |s|
  s.name        = "pre-activemodel"
  s.version     = Pre::ActiveModel::VERSION
  s.authors     = ["Thomas Devol"]
  s.email       = ["thomas.devol@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Provides active model validator for Pre}
  s.description = %q{Provides active model validation integration with the Pre email validation library}

  s.rubyforge_project = "pre-activemodel"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  ["rspec", "mocha", "pry-nav"].each {|lib| s.add_development_dependency lib}
  s.add_runtime_dependency "pre"
end
