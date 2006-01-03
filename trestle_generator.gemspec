require 'rubygems'

spec = Gem::Specification.new do |s|
  s.name = 'trestle_generator'
  s.version = '1.0.0'
  s.summary = 'An adaptation of the Rails scaffold generator that produces ' +
              'production-ready controllers that are safe from state-' +
              'changing HTTP GET requests and have a streamlined controller ' +
              'design'
  s.description = <<-EOF
    Why use the trestle generator instead of the scaffold generator? The trestle
    generator produces code that is closer to production-quality in two
    respects:
    
    SAFETY  The trestle generator uses the HTTP POST method for actions that
    change data. Well-behaved web applications protect themselves against errant
    GET requests (such as come from Google Web Accelerator and the like). The
    scaffold generator fails to do this.
    
    SIMPLICITY  The trestle generator produces controllers with just four
    actions (index, new, edit, and destroy). Controllers produced by the
    scaffold generator have eight actions. Fewer actions exposed to the outside
    world is better if the behavior of these actions is in line with the
    semantics of GET and POST. The net effect is that you will not have to throw
    away or tweak as much trestle-generated code as you do scaffold-generated
    code. Less work for you means your application gets built sooner and better.
    
    The scaffold generator produces a controller with the following public
    interface for a database table named 'people':
    
    /people - lists existing person records
    
    /people/list - lists existing person records
    
    /people/new - shows an empty person form
    
    /people/create - creates a new person record from request parameters
    
    /people/show/99 - shows the person record having ID 99
    
    /people/edit/99 - shows a person form for the person record having ID 99
    
    /people/update/99 - updates the person record having ID 99 using request
    parameters
    
    /people/destroy/99 - deletes the person record having ID 99, even for HTTP
    GET!
    
    Contrast this with the public interface produced by the trestle generator:
    
    /people - lists existing person records
    
    /people/new - HTTP GET shows an empty person form; HTTP POST creates a new
    person record from request parameters
    
    /people/99 - shows the person record having ID 99
    
    /people/99/edit - HTTP GET shows a person form for the person record having
    ID 99; HTTP POST updates the person record having ID 99 using request
    parameters
    
    /people/99/destroy - HTTP GET redirects to the person form with a notice
    that the user must click the form’s Destroy button to destroy a record; HTTP
    POST deletes the person record having ID 99 after prompting the user for
    confirmation
    
    Notice the hierarchical nature of trestle URLs. Because the ID comes before
    the verb, there are fewer illegal variations that with scaffold URLs. This
    encourages the user to use the Up One Level button on the Google Toolbar
    that clips one element off the end of the current URL. Scaffold URLs do not
    play nicely with the Up One Level button.
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
