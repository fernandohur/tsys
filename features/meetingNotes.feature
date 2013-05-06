Feature: Meeting Note management
  In order to blah
  A user
  Should blah


  Scenario: Delete a meeting note for an existing meeting when there is 1 meeting note
    Given there is only 1 meeting with 1 note
    And I am on the meeting page
    And I click "notes"
    When I click "remove"
    Then I should see "note destroyed"
    And I should see "This are the notes you have done for a meeting"

  Scenario: Try to delete a meeting note for an existing meeting when there is no note
    Given there is only 1 meeting with 0 note
    And I am on the meeting page
    When I click "notes"
    And I should see "This are the notes you have done for a meeting"
    Then I should not see "remove"

  Scenario: Try to delete a meeting note for an existing meeting when there are 2 meeting's notes
    Given there is only 1 meeting with 2 note
    And I am on the meeting page
    And I click "notes"
    When I click the first "remove"
    Then I should see "This are the notes you have done for a meeting"
    And I should see "note destroyed"
    And I should see "remove"


  Scenario: Delete file from the meeting note for an existing meeting when there is no file
    Given there is only 1 meeting notes with 0 files
    And I am on the meeting page
    When I click "notes"
    And I should see "This are the notes you have done for a meeting"
    Then I should not see "remove file"

  Scenario: Delete file from the meeting note for an existing meeting when there is 1 file
    Given there is only 1 meeting notes with 1 files
    And I am on the meeting page
    When I click "notes"
    And I should see "This are the notes you have done for a meeting"
    When I click "remove file"
    Then I should see "file remove"

