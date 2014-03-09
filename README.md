# Blinder

This is a work in progress! Of course, what isn't? Essentially, I wanna use this textbook Rails app
to handle RFP collections for SCRC. At some point, I'll have to write a _real_ README.

## Running Cucumber

This forked version has Cucumber included.

Running Cucumber in a nutshell:

* Run `rails server`

* To run tests for only one feature, from the project root, run `bundle exec cucumber features/<featurename>.feature -r features`

* To run tests for all features, from the project root, run `bundle exec cucumber -r features`

For the time being, Cucumber is configured to launch whatever the default browser is for your system.
If your default browser happens to be Chrome, launching Cucumber will not work for you unless you install Chromedriver.

Information on the installation of Chromedriver may be found here:  https://code.google.com/p/selenium/wiki/ChromeDriver
