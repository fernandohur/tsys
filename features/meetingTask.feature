Feature: Meeting Task management
  In order to blah
  A user
  Should blah


  Scenario: Delete a meeting task for an existing meeting when there is 1 meeting task
    Given there is only 1 meeting with 1 task
    And I am on the meeting page
    And I click "tasks"
    When I click "remove"
    Then I should see "task destroyed"
    And I should see "These are the tasks that you have of the meeting"

  Scenario: Try to delete a meeting task for an existing meeting when there is no task
    Given there is only 1 meeting with 0 task
    And I am on the meeting page
    When I click "tasks"
    And I should see "These are the tasks that you have of the meeting"
    Then I should not see "remove"

  Scenario: Try to delete a meeting note for an existing meeting when there are 2 meeting's tasks
    Given there is only 1 meeting with 2 task
    And I am on the meeting page
    And I click "tasks"
    When I click the first "remove"
    Then I should see "These are the tasks that you have of the meeting"
    And I should see "task destroyed"
    And I should see "remove"