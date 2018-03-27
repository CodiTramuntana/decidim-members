# frozen_string_literal: true

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "decidim/members/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "decidim-members"
  s.version     = Decidim::Members::VERSION
  s.authors     = ["Isaac Massot"]
  s.email       = ["isaac.mg@coditramuntana.com"]
  s.homepage    = "https://www.coditramuntana.com/"
  s.summary = "Member list and search plugin for decidim"
  s.description = s.summary
  s.license     = "AGPL 3.0"

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", "~> 0.10.0"
  s.add_dependency "rails", "~> 5.1.4"
  s.add_dependency "sanitize", "~> 4.5"
  s.add_dependency "pg_search"

  s.add_development_dependency "decidim-dev", '~> 0.10.0'
  s.add_development_dependency "decidim-admin", '~> 0.10.0'
end
