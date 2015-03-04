ArteJS website
===========================================

This website is built using Jekyll, and produces all static content. It is hosted at http://vistaprint.github.io/ArteJS.

Documentation for ArteJS is in markdown, in /site/*.md.

## Get ArteJS
* Clone a working directory for [ArteJS](http://vistaprint.github.io/ArteJS)
* Ideally, place it next to the working directory for this repository

## Building the site
To build the site:
* Make edits
* Run ```grunt```
* Test the site in site/_site

## Deploying the site
To deploy, use the platform specific deployment script, and pass the path to the ArteJS repo:

* On Mac/*nix: ./publish-site.sh ../ArteJS
* On Windows: ./publish-site.ps1 ../ArteJS

## Installation of dependencies

* Install [Ruby](http://rubyinstaller.org/downloads/)
 * Add ruby bin dir to your PATH environment variable
 * Mac users should have Ruby installed already

* Install RubyDevKit on Windows
 * On windows, use [RubyDevKit](http://rubyinstaller.org/downloads/)
 * Follow the [installation instructions](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit) 

* Install Python 2.7
 * Mac users should ensure they have python 2.7+ installed.
 * Windows users should use the [Python 2.7.5 Windows X86-64 Installer](http://www.python.org/getit/). *On windows, add C:\Python27;C:\Python27\Scripts to your PATH*

*  Install python easy_install
 * Mac installation (use setuptools 1.1): https://pypi.python.org/pypi/setuptools
 * Windows installation: https://pypi.python.org/pypi/setuptools/1.1#windows

Note: Jekyll uses Pygments for syntax coloring.  Pygments requires Python and Ruby, and can be installed via easy_install.

* Install [Pygments](http://pygments.org/download/) (Python)
 * Run ```easy_install Pygments```

* Install [Jekyll](http://jekyllrb.com/docs/installation/)
 * Windows: ```gem install jekyll```
 * Mac: ```sudo gem install jekyll```
 * _If you need to uninstall pygments 5.2 and install 5.0:_
 * *http://stackoverflow.com/questions/17364028/jekyll-on-windows-pygments-not-working*

```
gem uninstall pygments.rb --version "=0.5.2"
gem install pygments.rb --version "=0.5.0"
```

 * If Jekyll errors out on windows with bad paths, its probably this: http://stackoverflow.com/questions/21164557/jekyll-serve-error-invalid-argument-issue

```
gem uninstall jekyll
gem install jekyll --version "=1.4.2"
```

* Install node:
 * http://nodejs.org/download/

* Install grunt
 * You can install grunt by using npm, run the following command: 
 * ```npm install -g grunt-cli```

* Install NPM packages
 * ```npm install```

# Adding a new module
To add a new library/module to ArteJS, do the following:
* Add a documentation file: site/*.md (i.e. jquery.breakpoints.md)
* Add to the site menu: site/_layouts/main-outer.html (remember to add in alphabetical order) 
* Add to the homepage: site/index.html
* Add to download builder: site/javascripts/dependency-tree.js

# Notes
* Debugging:
 * Use node-inspector
 * ```node-inspector --web-port=8081```

* Debug grunt: 
 * Run ```node --debug-brk C:\Users\{username}\AppData\Roaming\npm\node_modules\grunt-cli\bin\grunt```

