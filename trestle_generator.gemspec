require 'rubygems'

spec = Gem::Specification.new do |s|
  s.name = 'trestle_generator'
  s.version = '0.5.0'
  s.summary = 'An adaptation of the Rails scaffold generator that produces production-ready controllers that are safe from state-changing HTTP GET requests and have a streamlined controller design'
  s.description = '(Include my README text here)'
  s.add_dependency('rails', '>= 1.0.0')
  s.files = Dir.glob('*.rb') + Dir.glob('USAGE') + Dir.glob('templates/*')
  s.files.delete_if { |item| item.include?(".gemspec") || item.include?(".svn") }
  s.require_path = 'templates'
  s.requirements << 'Ruby on Rails v1.0.0'
  s.author = "Nils Jonsson"
  s.email = "nils@alumni.rice.edu"
  s.rubyforge_project = "trestle"
  s.homepage = "http://www.rubyforge.org/projects/trestle"
end
