Feature: Can go to the main page
  In order to verify that I can get to the main page
  As a person who is not authenticated
  I want to be able to able to view the contents of the page

  Scenario: View the main page title under Chrome
    Given that I am using Chrome
    When I am unauthenticated and I visit the main page
    Then I should see the main page title

  Scenario: View the main page title under Firefox
    Given that I am using Firefox
    When I am unauthenticated and I visit the main page
    Then I should see the main page title
    And close the browser