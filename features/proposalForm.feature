Feature: Proposals form page
  In order to verify that the proposals form page is functional
  As a person who is not authenticated
  I want to be able to able to view and interact with the contents of the page

  Scenario: View the proposal form page under Firefox
    Given that I am using Firefox
    When I am unauthenticated and I visit the main page
    And click on the proposals page link
    Then I should see the proposals page title
    And I should be able to see the form element for Talk Title

