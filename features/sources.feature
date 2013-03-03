Feature: Source management
  In order to blah
  A user
  Should blah

  Scenario: when there are no sources I should see 0 sources
    Given there is only 0 source with 0 note
    And I am on the source page
    Then I should not see "view"
    And I should not see "notes"
    And I should not see "remove"

  Scenario: when there are sources I should see sources
    Given there is only 1 source with 0 note
    And I am on the source page
    Then I should see "view"
    And I should see "notes"
    And I should see "remove"

  Scenario Outline: when there are many sources I should many sources
    Given there is only <sources> source with 0 note
    And I am on the source page
    Then there should be <sources> sources
    And I should see <times> anchors
  Examples:
    |sources|times|
    |2|10         |
    |3|14         |
    |4|18         |
    |5|22         |
    |6|26         |

  Scenario: link to create source page should work
    Given I am on the source page
    And I click "add source"
    Then I should be on "add source page"

  Scenario Outline: removing a source should reduce the number by 1

    And there is only <n> source with 0 note
    Given I am on the source page
    When I click the first "remove"
    Then I should be on the source page
    And I should see <p> anchors
    And there should be <k> sources
  Examples:
    |n|k|p|
    |1|0|2|
    |2|1|6|
    |3|2|10|
    |4|3|14|
    |5|4|18|
    |6|5|22|