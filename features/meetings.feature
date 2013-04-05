Feature: Meeting management
  In order to blah
  A user
  Should blah

#
#  Feature: Create a meeting
#  In order to create a meeting
#  A registered user
#  Should fill the fields

  Scenario: Create a meeting with a note
    Given I am on the create meeting page
    When I enter the note meeting of "fdfafda dadsa"
    And I press "Create"
    Then I should carlossee "The meeting has been successfully created"


  Scenario: when there are no meetings I should see 0 meetings
    Given there is only 0 meeting with 0 note
    And I am on the meeting page
    Then I should not see "view"
    And I should not see "notes"
    And I should not see "remove"

  Scenario: when there are meetings I should see meetings
    Given there is only 1 meeting with 0 note
    And I am on the meeting page
    Then I should see "view"
    And I should see "notes"
    And I should see "remove"

  Scenario Outline: when there are many meetings I should see many meetings
    Given there is only <meetings> meeting with 0 note
    And I am on the meeting page
    Then there should be <meetings> meetings
    And I should see <times> anchors
  Examples:
    |meetings|times|
    |2|12         |
    |3|17         |
    |4|22         |
    |5|27         |
    |6|32         |

  Scenario: link to create meeting page should work
    Given I am on the meeting page
    And I click "add meeting"
    Then I should be on the create meeting page

  Scenario Outline: removing a meeting should reduce the number by 1

    And there is only <n> meeting with 0 note
    Given I am on the meeting page
    When I click the first "remove"
    Then I should be on the meeting page
    And I should see <p> anchors
    And there should be <k> meetings
  Examples:
    |n|k|p|
    |1|0|2|
    |2|1|7|
    |3|2|12|
    |4|3|17|
    |5|4|22|
    |6|5|27|