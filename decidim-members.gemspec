# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'decidim/members/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'decidim-members'
  s.version     = Decidim::Members::VERSION
  s.authors     = ['Isaac Massot']
  s.email       = ['isaac.mg@coditramuntana.com']
  s.homepage    = 'https://www.coditramuntana.com/'
  s.summary = 'Member list and search plugin for decidim'
  s.description = 'This gem is a member list and search plugin for decidim, you can active the gem via system dashboard'
  s.license     = 'AGPL-3.0'
  s.required_ruby_version = ">= 3.0.2"

  s.files = Dir['{app,config,db,lib,vendor}/**/*', 'Rakefile', 'README.md']

  DECIDIM_VERSION = '>= 0.27.0'
  s.add_dependency 'decidim-core', DECIDIM_VERSION
  s.add_dependency 'pg_search', '>= 2.1.4'
  
  s.add_development_dependency 'decidim-admin', DECIDIM_VERSION
  s.add_development_dependency 'decidim-dev', DECIDIM_VERSION
end
