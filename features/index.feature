Feature: Can go to the root page
  In order to verify that I can get to the root page
  As a person who is not authenticated
  I want to be able to able to view the contents of the page


  Scenario: View the root page title
    Given that I am unauthenticated and I visit the root page
    Then I should see the root page title
    

  Scenario: Assert that the user can navigate from root to the proposals form page
    Given that I am unauthenticated and I visit the root page
    Then I should be able to click the 'Submit a proposal!' link
    And verify that text 'Talk Information' is present on the page
    