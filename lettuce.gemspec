# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "lettuce/version"

Gem::Specification.new do |s|
  s.name        = "lettuce"
  s.version     = Lettuce::VERSION
  s.authors     = ["Tom Rudick"]
  s.email       = ["tmrudick@gmail.com"]
  s.homepage    = "http://github.com/tmrudick/lettuce"
  s.summary     = %q{A Ruby hRecipe Microformat parser}
  s.description = %q{A Ruby hRecipe Microformat parser using Nokogiri}

  s.rubyforge_project = "lettuce"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency "nokogiri"
end
