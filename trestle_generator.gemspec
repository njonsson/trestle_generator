require 'rubygems'

spec = Gem::Specification.new do |s|
  s.name = 'trestle_generator'
  s.version = '1.0.2'
  s.summary = '[Rails] A drop-in replacement for the scaffold generator that ' +
              'produces production-ready controllers that are safe from state-' +
              'changing HTTP GET requests and that have streamlined URLs.'
  s.description = <<-EOF
    Don’t drive your train across a gorge with nothing but a scaffold underneath
    it. Use a trestle instead!
    
    The trestle generator is drop-in replacement for the Rails scaffold
    generator. Unlike scaffolding, trestle controllers protect your models from
    state-changing HTTP GET requests. They also have streamlined URLs that make
    your application more usable.
    
    SAFETY  The trestle generator requires the HTTP POST method for actions that
    change data. Well-behaved web applications protect themselves against errant
    HTTP GET requests such as come from Google Web Accelerator and the like.
    Scaffolded controllers fail to do this.
    
    USABILITY  Trestle controllers have just five actions (list, new, show,
    edit, and destroy). The scaffold generator produces controllers that have
    eight actions. Fewer actions exposed to the outside world is better if the
    behavior of these actions is in line with the semantics of HTTP GET and HTTP
    POST. The net effect of this design improvement is that you will not have to
    throw away or tweak as much trestle-generated code as you do
    scaffold-generated code. Less work for you means your application gets built
    sooner. Tobias Lütke’s postback_generator RubyGem had the same idea, but
    trestle goes further.
    
    A scaffold for a database table named ‘people’ has the following HTTP
    interface:
    
    /people - Lists existing person records
    
    /people/list - Lists existing person records
    
    /people/new - Shows an empty person form
    
    /people/create - Creates a new person record from request parameters
    
    /people/show/99 - Shows the person record having ID 99
    
    /people/edit/99 - Shows a person form for the person record having ID 99
    
    /people/update/99 - Updates the person record having ID 99 using request
                        parameters
    
    /people/destroy/99 - Deletes the person record having ID 99, even for HTTP
                         GET!
    
    Contrast this with the HTTP interface of the equivalent trestle controller:
    
    /people - GET or POST lists existing person records
    
    /people/new - GET shows an empty person form
    
    /people/new - POST creates a new person record from request
                  parameters
                  
    /people/99 - GET or POST shows the person record having ID 99
    
    /people/99/edit - GET shows a person form for the person record having ID 99
    
    /people/99/edit - POST updates the person record having ID 99 using request
                      parameters
    /people/99/destroy - GET redirects to /people/99/edit with a notice that the
                         user must click the form’s Destroy button in order to
                         destroy a record
    
    /people/99/destroy - POST deletes the person record having ID 99 after
                         prompting the user for confirmation
    
    Notice the hierarchical nature of trestle URLs. Because the ID comes before
    the verb, the user can click the Up One Level button on the Google Toolbar
    to explore the application. (The Up One Level button clips one element off
    the end of the current URL.) Scaffold URLs do not play nicely with the Up
    One Level button.
    
    Trestle controllers are pain relief to users who like the Up One Level
    button. But for a user who likes to type URLs in by hand, it also shows a
    friendly notice if his request is missing an ID. This is one more way to
    improve usability.
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
