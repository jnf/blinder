# Blinder

This is a work in progress! Of course, what isn't? Essentially, I wanna use this textbook Rails app
to handle CFP collections for SCRC. At some point, I'll have to write a _real_ README.

## Running Cucumber

This forked version has Cucumber included.

Running Cucumber in a nutshell:

* Run `rails server`

* To run tests for only one feature, from the project root, run `bundle exec cucumber features/<featurename>.feature -r features`

* To run tests for all features, from the project root, run `bundle exec cucumber -r features`

For the time being, Cucumber is configured to launch whatever the default browser is for your system.
If your default browser happens to be Chrome, launching Cucumber will not work for you unless you install Chromedriver.

Information on the installation of Chromedriver may be found here:  https://code.google.com/p/selenium/wiki/ChromeDriver

## Generating a .env for use with Foreman

A recent PR added email capabilities via the Postmark gem, which requires a few environment variables to be set when the server is started. You'll need to add entries in .env for `POSTMARK_API_KEY`, `POSTMARK_SMTP_SERVER`, and `POSTMARK_INBOUND_ADDRESS` to use the emailing functionality.

If you are one of the heroku collaborators, you can get these values from `heroku config:get`. Otherwise, you'll have to create your own postmark account and generate your own values for those keys.

Similarly, if you'd like to enable rollbar, the error reporting service we've chosen, you'll need to set ROLLBAR_ACCESS_TOKEN in the .env file using the values from heroku (either our setup if you're a collaborator or your own account).

Use Foreman to start the web server and automatically load the .env variables by using `foreman start`.