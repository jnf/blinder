=begin --- Commenting out for now because there's some issues locally with getting Chromedriver to work correctly.
Given(/^that I am using Chrome$/) do
  profile = Selenium::WebDriver::Chrome::Profile.new
  profile['download.prompt_for_download'] = false
  profile['download.default_directory'] = "/Users/brennx0r/Documents/projects/blinder/bin"

  b = Watir::Browser.new :chrome, :profile => profile
end
=end


Given(/^that I am using Firefox$/) do
  @b = Watir::Browser.start 'http://ponies'
end

When(/^I am unauthenticated and I visit the main page$/) do
  @b.goto 'http://127.0.0.1:3000/'
end

Then(/^I should see the main page title$/) do
  @b.text.include? "I'm the info page!"
end


And(/^close the browser$/) do
  @b.close
end