Feature: Proposals form page
  In order to verify that the proposals form page displays all the expected fields
  As a person who is not authenticated
  I want to be able to view the key content display of the page

  Scenario: The proposals page displays the field Talk Title
    Given that I am unauthenticated and I visit the proposals page
    Then I should be able to see the text field for Talk Title

  Scenario: The proposals page displays the field Talk Abstract
    Given that I am unauthenticated and I visit the proposals page
    Then I should be able to see the text area for Talk Abstract

  Scenario: The proposals page displays the field Talk Focus
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals Talk Focus field is a radio
    And I should be able to see the radio button option 'Technical' for Talk Abstract
    And I should be able to see the radio button option 'People' for Talk Abstract
    And I should be able to see the radio button option 'Both' for Talk Abstract

  Scenario: Under Firefox, the proposals page displays the field "Intended Audience..."
    Given that I am unauthenticated and I visit the proposals page
    Then I should be able to see the text field for Intended Audience

  Scenario: Under Firefox, the proposals page displays the field "Why would this talk..."
    Given that I am unauthenticated and I visit the proposals page
    Then I should be able to see the text area for Why would this talk be a good fit for the Steel City Ruby audience?

  Scenario: Under Firefox, the proposals page displays the field Previous Conference Speaking Experience
    Given that I am unauthenticated and I visit the proposals page
    Then I should be able to see the text area for Previous Conference Speaking Experience

  Scenario: Under Firefox, the proposals page displays the field Years of Ruby Experience
    Given that I am unauthenticated and I visit the proposals page
    Then I should be able to see the text field for Years of Ruby Experience

  Scenario: Under Firefox, the proposals page displays the field "Do you have any current or past connections..."
    Given that I am unauthenticated and I visit the proposals page
    Then I should be able to see the text area for Do you have any current or past connections to the Western PA area? If so, what?

  Scenario: Under Firefox, the proposals page displays the field "At which other conferences..."
    Given that I am unauthenticated and I visit the proposals page
    Then I should be able to see the text area for At which other conferences has this talk been presented?

  Scenario: Under Firefox, the proposals page displays the field URL to a headshot or avatar
    Given that I am unauthenticated and I visit the proposals page
    Then I should be able to see the text field for URL to a headshot or avatar

  Scenario: Under Firefox, the proposals page displays the field T-shirt cut
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals T-shirt cut field descriptor
    And I should be able to see the radio button option 'Mens' for T-shirt cut
    And I should be able to see the radio button option 'Womens' for T-shirt cut

  Scenario: Under Firefox, the proposals page displays the field T-shirt size
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals T-shirt cut field descriptor
    And I should be able to see the radio button option 'XS' for T-shirt size
    And I should be able to see the radio button option 'S' for T-shirt size
    And I should be able to see the radio button option 'M' for T-shirt size
    And I should be able to see the radio button option 'L' for T-shirt size
    And I should be able to see the radio button option 'XL' for T-shirt size
    And I should be able to see the radio button option '2XL' for T-shirt size
    And I should be able to see the radio button option '3XL' for T-shirt size
    And I should be able to see the radio button option '4XL' for T-shirt size
    And I should be able to see the radio button option '5XL' for T-shirt size

  Scenario: Under Firefox, the proposals page displays the field Name
    Given that I am unauthenticated and I visit the proposals page
    Then I should be able to see the text field for Name

  Scenario: Under Firefox, the proposals page displays the field Email Address
    Given that I am unauthenticated and I visit the proposals page
    Then I should be able to see the text field for Email Address

  Scenario: Under Firefox, the proposals page displays the field Phone Number
    Given that I am unauthenticated and I visit the proposals page
    Then I should be able to see the text field for Phone Number

  Scenario: Under Firefox, the proposals page displays the field Bio
    Given that I am unauthenticated and I visit the proposals page
    Then I should be able to see the text area for Bio

  Scenario: Under Firefox, the proposals page displays the field Websites
    Given that I am unauthenticated and I visit the proposals page
    Then I should be able to see the text field for Websites

  Scenario: Under Firefox, the proposals page displays the field Twitter
    Given that I am unauthenticated and I visit the proposals page
    Then I should be able to see the text field for Twitter