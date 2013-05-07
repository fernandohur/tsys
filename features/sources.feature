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

  Scenario: link to create source page should work
    Given I am on the source page
    And I click "add source"
    Then I should be on "add source page"

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

  Scenario Outline: removing a source should reduce the number by 1
    Given I am on the source page
    And there is only <n> source with 0 note
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

  Scenario: sorting sources by date
    Given I am on the source page
    And there are no sources
    And I create a source with name = "source1"
    And I create a source with name = "source2"
    When I click "date_desc"
    Then I should be on the source page
    And there should be 2 sources
    And the source in position 0 should have "source2"
    And the source in position 1 should have "source1"

  Scenario: sorting sources by date asc
    Given I am on the source page
    And there are no sources
    And I create a source with name = "source1"
    And I create a source with name = "source2"
    When I click "date_asc"
    Then I should be on the source page
    And there should be 2 sources
    And the source in position 0 should have "source1"
    And the source in position 1 should have "source2"

  Scenario: filtering by category


