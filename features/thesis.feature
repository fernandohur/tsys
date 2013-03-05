Feature: Creation of a Thesis

  Scenario: Succesful creation
    Given I am in the create thesis page
    When I enter a valid name for the thesis
    And I click "submit"
    Then I should see "Thesis was succesfully created"

  Scenario:  Unsuccesful creation
    Given I am in the create thesis page
    When I enter nothing as a name
    And I click "submit"
    Then I should see "Name is too short"