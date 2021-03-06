require 'rubygems'

spec = Gem::Specification.new do |s|
  s.name = 'trestle_generator'
  s.version = '1.1.7.3'
  s.summary = '[Rails] A drop-in replacement for the scaffold generator that ' +
              'produces production-ready controllers that are safe from '      +
              'state-changing HTTP GET requests and that have streamlined URLs.'
  s.description = 'Industrial-strength scaffolding for Ruby on Rails '         +
                  'application development. A drop-in replacement for the '    +
                  'scaffold generator that produces production-ready '         +
                  'controllers that are safe from state-changing HTTP GET '    +
                  'requests and that have streamlined URLs.'
  s.files = Dir.glob('*.rb')                 +
            Dir.glob('History.markdown')     +
            Dir.glob('MIT-LICENSE.markdown') +
            Dir.glob('README.markdown')      +
            Dir.glob('USAGE')                +
            Dir.glob('templates/*')
  s.files.delete_if do |item|
    item.include?(".gemspec") || item.include?(".svn")
  end
  s.require_path = 'templates'
  s.requirements << 'Ruby on Rails v1.0.0 or later'
  s.author = "Nils Jonsson"
  s.email = "nils@alumni.rice.edu"
  s.rubyforge_project = "trestle"
  s.homepage = "http://trestle.rubyforge.org/"
end
