Feature: Proposals form page
  In order to verify that the proposals form page displays all the expected fields
  As a person who is not authenticated
  I want to be able to view the key content display of the page

  Scenario: The proposals page displays the field Talk Title
    Given that I am unauthenticated and I visit the proposals page
    Then I should be able to see the text field for Talk Title

  Scenario: Under Firefox, the proposals page displays the field Talk Abstract
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals Talk Abstract field descriptor
    And I should be able to see the text area for Talk Abstract
    And close the browser

  Scenario: Under Firefox, the proposals page displays the field Talk Abstract
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals Talk Abstract field descriptor
    And I should be able to see the text area for Talk Abstract
    And close the browser

  Scenario: Under Firefox, the proposals page displays the field Talk Focus
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals Talk Focus field descriptor
    And I should be able to see the radio button option 'Technical' for Talk Abstract
    And I should be able to see the radio button option 'People' for Talk Abstract
    And I should be able to see the radio button option 'Both' for Talk Abstract
    And close the browser

  Scenario: Under Firefox, the proposals page displays the field "Intended Audience..."
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals Intended Audience (technical level, background, etc.) field descriptor
    And I should be able to see the text field for "Intended Audience..."
    And close the browser

  Scenario: Under Firefox, the proposals page displays the field "Why would this talk..."
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals Why would this talk be a good fit for the Steel City Ruby audience? field descriptor
    And I should be able to see the text area for "Why would this talk..."
    And close the browser

  Scenario: Under Firefox, the proposals page displays the field Previous Conference Speaking Experience
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals Previous Conference Speaking Experience field descriptor
    And I should be able to see the text area for Previous Conference Speaking Experience
    And close the browser

  Scenario: Under Firefox, the proposals page displays the field Years of Ruby Experience
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals Years of Ruby Experience field descriptor
    And I should be able to see the text field for Years of Ruby Experience
    And close the browser

  Scenario: Under Firefox, the proposals page displays the field "Do you have any current or past connections..."
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals Do you have any current or past connections to the Western PA area? If so, what? field descriptor
    And I should be able to see the text area for "Do you have any current or past connections..."
    And close the browser

  Scenario: Under Firefox, the proposals page displays the field "At which other conferences..."
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals At which other conferences has this talk been presented? field descriptor
    And I should be able to see the text area for "At which other conferences..."
    And close the browser

  Scenario: Under Firefox, the proposals page displays the field URL to a headshot or avatar
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals URL to a headshot or avatar field descriptor
    And I should be able to see the text field for URL to a headshot or avatar
    And close the browser

  Scenario: Under Firefox, the proposals page displays the field T-shirt cut
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals T-shirt cut field descriptor
    And I should be able to see the radio button option 'Mens' for T-shirt cut
    And I should be able to see the radio button option 'Womens' for T-shirt cut
    And close the browser

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
    And close the browser

  Scenario: Under Firefox, the proposals page displays the field Name
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals Name field descriptor
    And I should be able to see the text field for Name
    And close the browser

  Scenario: Under Firefox, the proposals page displays the field Email Address
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals Email Address field descriptor
    And I should be able to see the text field for Email Address
    And close the browser

  Scenario: Under Firefox, the proposals page displays the field Phone Number
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals Phone Number field descriptor
    And I should be able to see the text field for Phone Number
    And close the browser

  Scenario: Under Firefox, the proposals page displays the field Bio
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals Bio field descriptor
    And I should be able to see the text area for Bio
    And close the browser

  Scenario: Under Firefox, the proposals page displays the field Websites
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals Websites field descriptor
    And I should be able to see the text field for Websites
    And close the browser

  Scenario: Under Firefox, the proposals page displays the field Twitter
    Given that I am unauthenticated and I visit the proposals page
    Then I should see the proposals Twitter field descriptor
    And I should be able to see the text field for Twitter
    And close the browser