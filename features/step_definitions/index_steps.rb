Then(/^I should see the root page title$/) do
  @b.text.include? "I'm the info page!"
end


And(/^close the browser$/) do
  @b.close
end

Then(/^I should be able to click the 'Submit a proposal!' link$/) do
  @b.link(:text => 'Submit a proposal!').click
end

And(/^verify that text 'Talk Information' is present on the page$/) do
  @b.text.include? "Talk Information"
end

Given(/^that I am unauthenticated and I visit the root page$/) do
  p @b.goto 'http://127.0.0.1:3000/'
end