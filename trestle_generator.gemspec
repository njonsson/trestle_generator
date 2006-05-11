require 'rubygems'

spec = Gem::Specification.new do |s|
  s.name = 'trestle_generator'
  s.version = '1.1.4'
  s.summary = '[Rails] A drop-in replacement for the scaffold generator that ' +
              'produces production-ready controllers that are safe from '      +
              'state-changing HTTP GET requests and that have streamlined URLs.'
  s.description = <<-EOF
    ============================================================================
    Trestle Generator
    ============================================================================

    A drop-in replacement for Ruby on Rails’s scaffold generator

    Everybody loves scaffolding, and with good reason. It’s the feature of the
    Ruby on Rails framework that makes a database table editable on the web in
    mere seconds, and with just a few lines of generated Ruby code.

    The trestle generator is drop-in replacement for the Rails scaffold
    generator. It produces scaffolding that’s more like production-quality code
    while maintaining all the rapid goodness you know and love about Rails.

    Don’t drive your train across a gorge with nothing but a scaffold underneath
    it. Use a trestle instead!

    Trestles have two advantages over scaffolds:

    * More elegant handling of HTTP POST and GET requests
    * A streamlined URL structure that makes your application easier to use

    Downloading and installation is a breeze with RubyGems, the package manager
    that’s included in most Ruby distributions. Just type the following at a
    command line:

        gem install trestle_generator

    Generating trestles for your database tables is also a one-step process:

        script/generate trestle YourModelNameHere

    ----------------------------------------------------------------------------
    Why switch from scaffolds to trestles? SAFETY
    ----------------------------------------------------------------------------

    The trestle generator produces Rails views that use HTTP POST to request
    changes (instead of GET). It also generates Rails controllers that execute
    such changes only for HTTP POST requests. Well-behaved web applications must
    protect user data against unwanted changes, including those arising from
    errant HTTP GET requests such as Google Web Accelerator is known to make.
    The scaffolding provided by Rails v1.1 is better about this than Rails v1.0
    was, but trestles solve the problem of GET vs POST more cleanly and
    comprehensively.

    ----------------------------------------------------------------------------
    Why switch from scaffolds to trestles? USABILITY
    ----------------------------------------------------------------------------

    Trestle controllers have just four actions (index, new, edit, and destroy).
    Contrast this with scaffold controllers which have eight actions to
    implement the same functionality. This is mostly a matter of taste, but
    Rails developers appreciate more than most that “less is more.”

    Just as important as aesthetics is the fact that trestle controllers better
    reflect GET and POST semantics, making for more intelligible HTTP
    conversations in your applications. (Apparently, Tobias Lütke wrote a
    postback_generator RubyGem with a similar philosophy, but trestles take the
    concept further.)

    Use trestles instead of scaffolding and you will find yourself throwing away
    and tweaking less code as you build out applications. As joyous as Ruby
    programming is, less code is still a good thing.

    Let’s look at some of the differences between trestles and scaffolds. A
    scaffold for a database table named ‘people’ has the following HTTP
    interface:

    URL                 Result
    ============================================================================
    /people             Lists existing person records
    /people/list
    ----------------------------------------------------------------------------
    /people/new         Shows an empty person form
    ----------------------------------------------------------------------------
    /people/create      Creates a new person record from request parameters
    ----------------------------------------------------------------------------
    /people/show/99     Shows the person record having ID 99
    ----------------------------------------------------------------------------
    /people/edit/99     Shows a person form for the person record having ID 99
    ----------------------------------------------------------------------------
    /people/update/99   Updates the person record having ID 99 using request
                        parameters
    ----------------------------------------------------------------------------
    /people/destroy/99  Deletes the person record having ID 99

    As of Rails v1.1, scaffold controllers reject requests to insert, update and
    delete records if the request is HTTP GET instead of POST. This is a safety
    improvement, but the design still leaves something to be desired.

    Contrast this with the HTTP interface of the equivalent trestle controller:

    URL                 HTTP Method  Result
    ============================================================================
    /people             GET or POST  Lists existing person records
    ----------------------------------------------------------------------------
    /people/new             GET      Shows an empty person form
                            POST     Creates a new person record from request
                                     parameters
    ----------------------------------------------------------------------------
    /people/99          GET or POST  Shows the person record having ID 99
    ----------------------------------------------------------------------------
    /people/99/edit         GET      Shows a person form for the person record
                                     having ID 99
                            POST     Updates the person record having ID 99
                                     using request parameters
    ----------------------------------------------------------------------------
    /people/99/destroy      GET      Redirects to /people/99/edit with a notice
                                     that the user must click the form’s Destroy
                                     button in order to destroy a record
                            POST     Deletes the person record having ID 99
                                     after prompting the user for confirmation

    A trestle degrades gracefully if the user has JavaScript turned off. And the
    hierarchical nature of trestle URLs, wherein the ID comes before the verb,
    lets the user click the Up One Level button on the Google Toolbar to explore
    the application. (The Up One Level button clips one element off the end of
    the current URL.) Scaffold URLs do not play nicely with the Up One Level
    button.

    The trestle interface is not just pain relief for users without JavaScript
    and those who like the Up One Level button. If you type URLs by hand, you
    get a friendly notice——instead of a Rails exception——if a request is missing
    an ID. There is simply less opportunity for error. That’s a tried-and-true
    way to up the usability factor.

    Do yourself and your users a favor by switching from scaffolds to trestles.

    Visit the RubyForge page (http://trestle.rubyforge.org/) for this open-
    source project. Contact me at nils@alumni.rice.edu.

    -- /\/. _/.
    Nils Jonsson
  EOF
  s.files = Dir.glob('*.rb')   +
            Dir.glob('README') +
            Dir.glob('USAGE')  +
            Dir.glob('templates/*')
  s.files.delete_if { |item| item.include?(".gemspec") || item.include?(".svn") }
  s.require_path = 'templates'
  s.requirements << 'Ruby on Rails v1.0.0 or later'
  s.author = "Nils Jonsson"
  s.email = "nils@alumni.rice.edu"
  s.rubyforge_project = "trestle"
  s.homepage = "http://trestle.rubyforge.org/"
end
