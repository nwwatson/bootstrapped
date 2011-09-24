# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bootstrapped/version"

Gem::Specification.new do |s|
  s.name        = "bootstrapped"
  s.version     = Bootstrapped::VERSION
  s.authors     = ["Nicholas Watson"]
  s.email       = ["nwwatson@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Twitters Bootstrap CSS in a gem}
  s.description = %q{Twitters Bootstrap CSS and JS files all in one nice little gem}

  s.rubyforge_project = "bootstrapped"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
