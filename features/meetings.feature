Feature: Create a meeting
  In order to create a meeting
  A registered user
  Should fill the fields

  Scenario: Create a meeting with a note
    Given I am on the create meeting page
    When I enter the note meeting of "fdfafda dadsa"
    And I press "Create"
    Then I should see "la cita fue exitosamente creada"

