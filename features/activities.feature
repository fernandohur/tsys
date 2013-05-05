Feature: Activities management
  In order to blah
  A user
  Should blah

  Scenario: creating an activity
    Given that I am in the activities index page
    And That I am a student with username z
    And I want to add an activity with name x
    When I click on Create
    Then I should see "Activity succesfully created"


  Scenario: creating comments to activities
    Given that I am in the activities index page
    And That I am a student with username z
    And I want to add a comment to an activity x
    And with text y
    Then I should see "Comment succesfully created"

