Feature: List of all Thesis

  Scenario: One or more thesis managing
    Given I am in the index thesis page
    And I am a professor managing one or more thesis
    Then  I should see "Author(s)"

  Scenario:  No thesis being managed
    Given I am in the index thesis page
    And I am a professor managing zero thesis
    Then I should see "Wow. Scratch that. You are not managing any thesis at the moment professor"