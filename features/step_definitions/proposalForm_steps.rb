Then(/^I should be able to see the text field for Talk Title$/) do
  assert(@b.text_field(:label, 'Talk Title').exists?)
end

Given(/^that I am unauthenticated and I visit the proposals page$/) do
  @b.goto 'http://127.0.0.1:3000/1/new'
end

And(/^I have filled out the form with all required information$/) do
  pending
end

Then(/^I should be able to see the text area for Talk Abstract$/) do
  assert(@b.text_field(:label => 'Talk Abstract').exists?)
end

Then(/^I should see the proposals Talk Focus field is a radio$/) do
  assert(@b.radio(:label => 'Talk Focus', :index => 0).exists?)
end

And(/^I should be able to see the radio button option 'Technical' for Talk Abstract$/) do
  assert(@b.radio(:value => 'Technical', :index => 0).exists?)
end

And(/^I should be able to see the radio button option 'People' for Talk Abstract$/) do
  assert(@b.radio(:value => 'People', :index => 1).exists?)
end

And(/^I should be able to see the radio button option 'Both' for Talk Abstract$/) do
  assert(@b.radio(:value => 'Bunny', :index => 1).exists?)
end

Then(/^I should be able to see the text field for Intended Audience$/) do
  assert(@b.text_field(:label, 'Intended Audience (technical level, background, etc)').exists?)
end

Then(/^I should be able to see the text area for Why would this talk be a good fit for the Steel City Ruby audience.*$/) do
  assert(@b.text_field(:label, 'Why would this talk be a good fit for the Steel City Ruby audience?').exists?)
end

Then(/^I should be able to see the text area for Previous Conference Speaking Experience$/) do
  assert(@b.text_field(:label, 'Previous Conference Speaking Experience').exists?)
end

Then(/^I should be able to see the text field for Years of Ruby Experience$/) do
  assert(@b.text_field(:label, 'Years of Ruby Experience').exists?)
end

Then(/^I should be able to see the text area for Do you have any current or past connections to the Western PA area\? If so, what\?$/) do
  assert(@b.text_field(:label, 'Do you have any current or past connections to the Western PA area? If so, what?').exists?)
end

Then(/^I should be able to see the text area for At which other conferences has this talk been presented\?$/) do
  assert(@b.text_field(:label, 'At which other conferences has this talk been presented?').exists?)
end

Then(/^I should be able to see the text field for URL to a headshot or avatar$/) do
  assert(@b.text_field(:label, 'URL to a headshot or avatar').exists?)
end

Then(/^I should see the proposals T-shirt cut field descriptor$/) do
  pending
end

And(/^I should be able to see the radio button option 'Mens' for T-shirt cut$/) do
  pending
end

And(/^I should be able to see the radio button option 'Womens' for T-shirt cut$/) do
  pending
end

And(/^I should be able to see the radio button option 'XS' for T-shirt size$/) do
  pending
end

And(/^I should be able to see the radio button option 'S' for T-shirt size$/) do
  pending
end

And(/^I should be able to see the radio button option 'M' for T-shirt size$/) do
  pending
end

And(/^I should be able to see the radio button option 'L' for T-shirt size$/) do
  pending
end

And(/^I should be able to see the radio button option 'XL' for T-shirt size$/) do
  pending
end

And(/^I should be able to see the radio button option '2XL' for T-shirt size$/) do
  pending
end

And(/^I should be able to see the radio button option '3XL' for T-shirt size$/) do
  pending
end

And(/^I should be able to see the radio button option '4XL' for T-shirt size$/) do
  pending
end

And(/^I should be able to see the radio button option '5XL' for T-shirt size$/) do
  pending
end

Then(/^I should be able to see the text field for Name$/) do
  assert(@b.text_field(:label, 'Name').exists?)
end

Then(/^I should be able to see the text field for Email Address$/) do
  assert(@b.text_field(:label, 'Email Address').exists?)
end

Then(/^I should be able to see the text field for Phone Number$/) do
  assert(@b.text_field(:label, 'Phone Number').exists?)
end

Then(/^I should be able to see the text area for Bio$/) do
  assert(@b.text_field(:label, 'Bio').exists?)
end

Then(/^I should be able to see the text field for Websites$/) do
  assert(@b.text_field(:label, 'Websites').exists?)
end

Then(/^I should be able to see the text field for Twitter$/) do
  assert(@b.text_field(:label, 'Twitter').exists?)
end

