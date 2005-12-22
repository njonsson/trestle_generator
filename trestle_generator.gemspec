require 'rubygems'

spec = Gem::Specification.new do |s|
#  s.add_dependency('rubyjdwp', '= 0.0.4')
  s.name = 'trestle_generator'
  s.version = '0.5.0'
  s.platform = Gem::Platform::RUBY
  s.summary = 'trestle generator is an adaptation of the Rails scaffold generator that produces controllers that are safe from state-changing HTTP GET requests and do not have an overabundance of actions'
#  s.requirements << 'Jabber server'
  s.files = Dir.glob("lib/**/*") # .delete_if { |item| item.include?("CVS") }
  s.require_path = 'lib'
  s.autorequire = 'jabber4r/jabber4r'
  s.author = "Nils Jonsson"
  s.email = "nils@jonssons.org"
  s.rubyforge_project = "trestle"
  s.homepage = "http://trestle.rubyforge.org/"
end
