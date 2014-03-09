Feature: Proposals form page
  In order to verify that the proposals form page is functional
  As a person who is not authenticated
  I want to be able to fill out and submit the form when validation is satisfied and the information is valid.

  Scenario: The proposals page field Talk Title accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have populated the text field for Talk Title with valid information
    Then I should be able to submit the form without error
    And I should see a success on submission message

  Scenario: The proposals page field Talk Abstract accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have populated the text area for Talk Abstract with valid information
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field Talk Abstract accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have populated the text area for Talk Abstract with valid information
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field Talk Focus accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have selected the radio button option 'Technical' for Talk Abstract
    Then I should be able to submit the form without error
    And I should see a success on submission message



  Scenario: The proposals page field Talk Focus accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have selected the radio button option 'People' for Talk Abstract
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field Talk Focus accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have selected the radio button option 'Both' for Talk Abstract
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field "Intended Audience..." accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have populated the text field for "Intended Audience..." with valid information
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field "Why would this talk..." accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have populated the text area for "Why would this talk..." with valid information
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field Previous Conference Speaking Experience accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have populated the text area for Previous Conference Speaking Experience with valid information
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field Years of Ruby Experience accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have populated the text field for Years of Ruby Experience with valid information
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field "Do you have any current or past connections..." accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have populated the text area for "Do you have any current or past connections..." with valid information
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field "At which other conferences..." accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have populated the text area for "At which other conferences..." with valid information
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field URL to a headshot or avatar accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have populated the text field for URL to a headshot or avatar with valid information
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field T-shirt cut accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have selected the radio button option 'Mens' for T-shirt cut
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field T-shirt cut accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have selected the radio button option 'Womens' for T-shirt cut
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field T-shirt size accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have selected the radio button option 'XS' for T-shirt size
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field T-shirt size accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have selected the radio button option 'S' for T-shirt size
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field T-shirt size accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have selected the radio button option 'M' for T-shirt size
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field T-shirt size accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have selected the radio button option 'L' for T-shirt size
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field T-shirt size accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have selected the radio button option 'XL' for T-shirt size
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field T-shirt size accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have selected the radio button option '2XL' for T-shirt size
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field T-shirt size accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have selected the radio button option '3XL' for T-shirt size
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field T-shirt size accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have selected the radio button option '4XL' for T-shirt size
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field T-shirt size accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have selected the radio button option '5XL' for T-shirt size
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field Name accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have populated the text field for Name with valid information
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field Email Address accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have populated the text field for Email Address with valid information
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field Phone Number accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have populated the text field for Phone Number with valid information
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field Bio accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have populated the text area for Bio with valid information
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field Websites accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have populated the text field for Websites with valid information
    Then I should be able to submit the form without error
    And I should see a success on submission message


  Scenario: The proposals page field Twitter accepts valid input data
    Given that I am unauthenticated and I visit the proposals page
    And I have filled out the form with all required information
    And I have populated the text field for Twitter with valid information
    Then I should be able to submit the form without error
    And I should see a success on submission message
