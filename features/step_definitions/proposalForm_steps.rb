Then(/^I should be able to see the text field for Talk Title$/) do
  @b.text_field(:label => 'Talk Title').exists?
end

Given(/^that I am unauthenticated and I visit the proposals page$/) do
  @b.goto 'http://127.0.0.1:3000/1/new'
end

And(/^I have filled out the form with all required information$/) do
  pending
end