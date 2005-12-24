require 'rubygems'

spec = Gem::Specification.new do |s|
  s.add_dependency('rails', '= 1.0.0')
  s.name = 'trestle_generator'
  s.version = '0.5.0'
  s.platform = Gem::Platform::RUBY
  s.summary = 'An adaptation of the Rails scaffold generator that produces production-ready controllers that are safe from state-changing HTTP GET requests and have a streamlined controller design'
  s.requirements << 'Rails'
  s.files = Dir.glob("lib/**/*").delete_if { |item| item.include?("CVS") || item.include?(".svn") }
  s.require_path = 'lib'
  s.autorequire = 'jabber4r/jabber4r'
  s.author = "Nils Jonsson"
  s.email = "nils@jonssons.org"
  s.rubyforge_project = "trestle"
  s.homepage = "http://trestle.rubyforge.org/"
end
