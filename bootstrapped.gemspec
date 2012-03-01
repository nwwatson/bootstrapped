# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bootstrapped/version"

Gem::Specification.new do |s|
  s.name        = "bootstrapped"
  s.version     ='0.1.1'
  s.authors     = ["Nicholas Watson"]
  s.email       = ["nwwatson@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Twitters Bootstrap CSS in a gem}
  s.description = %q{Twitters Bootstrap CSS and JS files all in one nice little gem}

  s.rubyforge_project = "bootstrapped"
  s.files = Dir["lib/**/*"] + Dir["vendor/**/*"] + ["Rakefile", "README.rdoc"]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency             'railties',   '>= 3.1'
  s.add_dependency             'actionpack', '>= 3.1'
  s.add_dependency             'less-rails' unless RUBY_PLATFORM == 'java'  
  s.add_development_dependency 'rails', '>= 3.1'
  s.add_development_dependency 'rspec-rails', '~> 2.6.1'
  s.add_development_dependency 'mocha', '~> 0.9.12'
  s.add_development_dependency 'cucumber', '~> 1.0.6'
  s.add_development_dependency "bundler", "~> 1.0.0"
  s.add_development_dependency "rails",   "~> 3.1"
  s.add_development_dependency 'sqlite3-ruby', '~> 1.3.1'
  
  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").select{|f| f =~ /^bin/}
  s.require_path = 'lib'
end
