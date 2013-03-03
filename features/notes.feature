Feature: Delete note
  In order to delete a note
  A user
  Should select the delete button in the source's notes page

  Scenario: Delete a note for an existing source when there is 1 note
    Given there is only 1 source with 1 note
    And I am on the source page
    And I click "notes"
    When I click "remove"
    Then I should see "note destroyed"
    And I should see "estas son las anotaciones que has hecho sobre la tesis"

  Scenario: Try to delete a note for an existing source when there is no notes
    Given there is only 1 source with 0 note
    And I am on the source page
    When I click "notes"
    And I should see "estas son las anotaciones que has hecho sobre la tesis"
    Then I should not see "remove"

  Scenario: Try to delete a note for an existing source when there are 2 notes
    Given there is only 1 source with 2 note
    And I am on the source page
    And I click "notes"
    When I click the first "remove"
    Then I should see "estas son las anotaciones que has hecho sobre la tesis"
    And I should see "note destroyed"
    And I should see "remove"