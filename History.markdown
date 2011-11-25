Version history for the _Trestle Generator_ project
===================================================

<a name="v1.1.7.3"></a>1.1.7.3 (August 17th, 2006)
--------------------------------------------------

* Refactored a redundant find expression [[vlazar](http://github.com/vlazar "vlazar at GitHub")]

<a name="v1.1.7.2"></a>1.1.7.2 (August 2nd, 2006)
-------------------------------------------------

* Fixed a bug in routes that substitutes _/:controller/:id/show_ for _/:controller/:id_ [[cayblood](http://github.com/cayblood "cayblood at GitHub")]

<a name="v1.1.7.1"></a>1.1.7.1 (July 19th, 2006)
------------------------------------------------

* Asserted bare template names instead of forcing a plural-model-name prefix

<a name="v1.1.7"></a>1.1.7 (July 1st, 2006)
-------------------------------------------

* Created the changelog
* Removed extended characters from gemspec description

<a name="v1.1.6"></a>1.1.6 (June 26th, 2006)
--------------------------------------------

* Fixed a bug inherited from scaffold generator: when a module is specified (e.g., _Admin::People_), the layout file gets created in _app/views/layouts_ instead of in a subdirectory (e.g., _app/views/layouts/admin_). At runtime Rails renders all those views without a layout

<a name="v1.1.5"></a>1.1.5 (May 17th, 2006)
-------------------------------------------

* Shortened the gem description to be friendlier to http://www.onestepback.org/gemwatch.rss
* Corrected a misstatement in the readme concerning the public interface of trestle controllers
* Added functional tests for _#show_, _#edit_ and _#destroy_ requests missing _:id_

<a name="v1.1.4"></a>1.1.4 (May 11th, 2006)
-------------------------------------------

* Added the readme to the list of files installed by the gem
* Made a minor wording change in the readme
* Removed a dependency on Rails to better serve those running Rails from the application's vendor directory
* Swapped constants in _routes.rb_ for variables, to suppress a Ruby warning

<a name="v1.1.3"></a>1.1.3 (May 11th, 2006)
-------------------------------------------

* Fixed a collision with existing migrations — closes [#4435](http://rubyforge.org/tracker/index.php?func=detail&aid=4435&group_id=1204&atid=4717 "Trestle Generator issue #4435 at RubyForge")

<a name="v1.1.2"></a>1.1.2 (April 18th, 2006)
---------------------------------------------

* Conformed to the format of _routes.rb_ from Rails trunk
* Updated the readme and gemspec description to match http://trestle.rubyforge.org

<a name="v1.1.0"></a>1.1.0 (March 14th, 2006)
---------------------------------------------

* Swapped _index_without_id_ and _index_with_id_ actions out for _list_ and _show_, using routes to produce hierarchical URLs

<a name="v1.0.2"></a>1.0.2 (January 27th, 2006)
-----------------------------------------------

* Used _singular_name_ instead of _model_name_ for proper capitalization

<a name="v1.0.1"></a>1.0.1 (January 10th, 2006)
-----------------------------------------------

* Used strings instead of symbols as arguments of _TestCase#get_ and _TestCase#post_

<a name="v1.0.0"></a>1.0.0 (January 3rd, 2006)
----------------------------------------------

(First release)
