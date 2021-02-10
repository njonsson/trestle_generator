Note
----

My reasons for starting this project are somewhat moot because of the REST support built into Ruby on Rails v1.2. (I can’t rule out the possibility that this project helped inspire the [SimplyRestful plugin](http://agilewebdevelopment.com/plugins/simplyrestful) that later became part of Rails, though!)

I now recommend that you use the Rails _scaffold_resource_ generator instead of my Trestle Generator. I think you’ll recognize in it the spirit and goals of the Trestle Generator, and it produces a standards-based API for your application, to boot.

— /\\/. _/.<br />
December 2006

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

View slides from a Trestle Generator presentation given to the [Houston Ruby and Rails Users Group](http://houstonrb.com) on Saturday, May 13, 2006 ([PowerPoint](http://trestle.rubyforge.org/trestle-2006-05-13.pps) or [PDF](http://trestle.rubyforge.org/trestle-2006-05-13.pdf)).

Trestle Generator
=================

**A drop-in replacement for Ruby on Rails’s scaffold generator**

Everybody loves scaffolding, and with good reason. It’s the feature of the Ruby on Rails framework that makes a database table editable on the web in mere seconds, and with just a few lines of generated Ruby code.

The trestle generator is drop-in replacement for the Rails scaffold generator. It produces scaffolding that’s more like production-quality code while maintaining all the rapid goodness you know and love about Rails.

Don’t drive your train across a gorge with nothing but a scaffold underneath it. Use a trestle instead!

Trestles have two advantages over scaffolds:

* More elegant handling of HTTP POST and GET requests
* A streamlined URL structure that makes your application easier to use

Downloading and installation is a breeze with RubyGems, the package manager that’s included in most Ruby distributions. Just type the following at a command line:

    gem install trestle_generator

Generating trestles for your database tables is also a one-step process:

    script/generate trestle YourModelNameHere

Why switch from scaffolds to trestles? _Safety_
-----------------------------------------------

The trestle generator produces Rails views that use HTTP POST to request changes (instead of GET). It also generates Rails controllers that execute such changes only for HTTP POST requests. Well-behaved web applications must protect user data against unwanted changes, including those arising from errant HTTP GET requests such as Google Web Accelerator is known to make. The scaffolding provided by Rails v1.1 is better about this than Rails v1.0 was, but trestles solve the problem of GET vs POST more cleanly and comprehensively.

Why switch from scaffolds to trestles? _Usability_
--------------------------------------------------

Trestle controllers have just five actions (_list_, _new_, _show_, _edit_, and _destroy_). Contrast this with scaffold controllers which have eight actions to implement the same functionality. This is mostly a matter of taste, but Rails developers appreciate more than most that “less is more.”

Just as important as aesthetics is the fact that trestle controllers better reflect GET and POST semantics, making for more intelligible HTTP conversations in your applications. (Apparently, [Tobias Lütke](http://github.com/tobi) wrote a _postback_generator_ with a similar philosophy, but trestles take the concept further.)

Use trestles instead of scaffolding and you will find yourself throwing away and tweaking less code as you build out applications. As joyous as Ruby programming is, less code is still a good thing.

Let’s look at some of the differences between trestles and scaffolds. A scaffold for a database table named _people_ has the following HTTP interface:

<table>
<thead>
<tr>
<th align="left" valign="bottom">URL</th>  <th align="left" valign="bottom">Result</th>
</tr>
</thead>
<tbody>
<tr>
<td valign="top">/people</td>              <td rowspan="2" valign="top">Lists existing person records</td>
</tr>
<tr>
<td valign="top">/people/list</td>
</tr>
<tr>
<td valign="top">/people/new</td>          <td valign="top">Shows an empty person form</td>
</tr>
<tr>
<td valign="top">/people/create</td>       <td valign="top">Creates a new person record from request parameters</td>
</tr>
<tr>
<td valign="top">/people/show/99</td>      <td valign="top">Shows the person record having ID 99</td>
</tr>
<tr>
<td valign="top">/people/edit/99</td>      <td valign="top">Shows a person form for the person record having ID 99</td>
</tr>
<tr>
<td valign="top">/people/update/99</td>    <td valign="top">Updates the person record having ID 99 using request parameters</td>
</tr>
<tr>
<td valign="top">/people/destroy/99</td>   <td valign="top">Deletes the person record having ID 99</td>
</tr>
</tbody>
</table>

As of Rails v1.1, scaffold controllers reject requests to insert, update and delete records if the request is HTTP GET instead of POST. This is a safety improvement, but the design still leaves something to be desired.

Contrast this with the HTTP interface of the equivalent trestle controller:

<table>
<thead>
<tr>
<th align="left" valign="bottom">URL</th>             <th align="left" valign="bottom">HTTP Method</th>  <th align="left" valign="bottom">Result</th>
</tr>
</thead>
<tbody>
<tr>
<td valign="top">/people</td>                         <td valign="top">GET or POST</td>                  <td valign="top">Lists existing person records</td>
</tr>
<tr>
<td rowspan="2" valign="top">/people/new</td>         <td valign="top">GET</td>                          <td valign="top">Shows an empty person form</td>
</tr>
<tr>
                                                      <td valign="top">POST</td>                         <td valign="top">Creates a new person record from request parameters</td>
</tr>
<tr>
<td valign="top">/people/99</td>                      <td valign="top">GET or POST</td>                  <td valign="top">Shows the person record having ID 99</td>
</tr>
<tr>
<td rowspan="2" valign="top">/people/99/edit</td>     <td valign="top">GET</td>                          <td valign="top">Shows a person form for the person record having ID 99</td>
</tr>
<tr>
                                                      <td valign="top">POST</td>                         <td valign="top">Updates the person record having ID 99 using request parameters</td>
</tr>
<tr>
<td rowspan="2" valign="top">/people/99/destroy</td>  <td valign="top">GET</td>                          <td valign="top">Redirects to /people/99/edit with a notice that the user must click the form’s _Destroy_ button in order to destroy a record</td>
</tr>
<tr>
                                                      <td valign="top">POST</td>                         <td valign="top">Deletes the person record having ID 99 after prompting the user for confirmation</td>
</tr>
</tbody>
</table>

A trestle degrades gracefully if the user has JavaScript turned off. And the hierarchical nature of trestle URLs, wherein the ID comes before the verb, lets the user click the _Up One Level_ button on the Google Toolbar to explore the application. (The _Up One Level_ button clips one element off the end of the current URL.) Scaffold URLs do not play nicely with the _Up One Level_ button.

The trestle interface is not just pain relief for users without JavaScript and those who like the _Up One Level_ button. If you type URLs by hand, you get a friendly notice — instead of a Rails exception — if a request is missing an ID. There is simply less opportunity for error. That’s a tried-and-true way to up the usability factor.

Do yourself and your users a favor by switching from scaffolds to trestles.

Visit the RubyForge page (http://trestle.rubyforge.org) for this open-source project. Contact me at [nils@alumni.rice.edu](mailto:nils@alumni.rice.edu?subject=Trestle%20Generator).

— /\\/. _/.
