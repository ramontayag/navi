# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "navi/version"

Gem::Specification.new do |s|
  s.name = "navi"
  s.version = Navi::VERSION
  s.authors = ["Ramon Tayag"]
  s.email = ["ramon@tayag.net"]
  s.summary = "Database-backed menu"
  s.description = "Allows you to save menu items in the database. You can create your own renderer."
  s.homepage = "https://github.com/ramontayag/navi"

  s.rubyforge_project = "navi"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.license = 'MIT'

  # These gems are the only ones that this gem needs
  s.add_runtime_dependency "activesupport", [">= 3.0.0"]
  s.add_runtime_dependency "activerecord", [">= 3.0.0"]
  s.add_runtime_dependency "ordered_tree", [">= 0.1.6"]
  s.add_runtime_dependency 'simple-navigation', ['~> 3.11.0']

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rails', ['~> 3.2.0']
  s.add_development_dependency 'jquery-rails', ['~> 2.2.1']
  s.add_development_dependency 'rspec-rails', ['~> 2.13.2']
  s.add_development_dependency 'cucumber-rails', ['0.5.2']
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'capybara', [">= 1.0.0.rc1"]
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'guard-cucumber', ['0.3.4']
  s.add_development_dependency 'nifty-generators'
  s.add_development_dependency 'factory_girl', '~> 4.2.0'
end
