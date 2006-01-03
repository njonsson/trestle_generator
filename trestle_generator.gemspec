require 'rubygems'

spec = Gem::Specification.new do |s|
  s.name = 'trestle_generator'
  s.version = '1.0.0'
  s.summary = 'An adaptation of the Rails scaffold generator that produces production-ready controllers that are safe from state-changing HTTP GET requests and have a streamlined controller design'
  s.description = <<EOF
Why use the trestle generator instead of the scaffold generator? The trestle generator produces code that is closer to production-quality in two respects:

SAFETY  the trestle generator uses the HTTP POST method for actions that change data

Well-behaved web applications protect themselves against errant GET requests (such as come from Google Web Accelerator and the like). The scaffold generator fails to do this.

SIMPLICITY  the trestle generator produces controllers with just four actions (index, new, edit, and destroy)

Controllers produced by the scaffold generator have eight actions. Fewer actions exposed to the outside world is better if the behavior of these actions is in line with the semantics of GET and POST. The net effect is that you will not have to throw away or tweak as much trestle-generated code as you do scaffold-generated code. Less work for you means your application gets built sooner and better.
EOF
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
