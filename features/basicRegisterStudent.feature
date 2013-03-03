Feature: Registering a new student
  In order to register a new student,
  As a professor
  I want to add the student to a thesis


  Scenario Outline: Complete data
    Given I am in the register studentPage
    And there are no students
    When I enter the field_name with <studentName>
    And I enter the Students username of <studentUsername>
    And I enter the Students password of <studentPass>
    And I click on Register
    Then I should see text equal to <result>

  Examples:
    |studentName |studentUsername|studentPass |  result             |
    |prueba      |pruebau1       |prueba      |Student Registed     |
    |prueba      |pruebau2       |prueba	  |Student Registed     |
    |prueba      |pruebau3       |prueba      |Student Registed     |
    |prueba      |prueba6        |prueba      |Student Registed     |
    |prueba      |pruebau4       |prueba      |Student Registed     |
    |prueba      |pruebau5       |prueba      |Student Registed     |


  Scenario Outline: Duplicated Data
    Given I am in the register studentPage
    When I enter the field_name with <studentName>
    And I enter the Students username of <studentUsername>
    And I enter the Students password of <studentPass>
    And there are students with the same userNameTest
    And I click on Register
    Then I should see text equal to <result>

  Examples:
    |studentName |studentUsername|studentPass |  result                 |
    |prueba      |pruebau1       |prueba      |Student NOT Registed     |
    |prueba      |pruebau2       |prueba	  |Student NOT Registed     |
    |prueba      |pruebau3       |prueba      |Student NOT Registed     |
    |prueba      |prueba6        |prueba      |Student NOT Registed     |
    |prueba      |pruebau4       |prueba      |Student NOT Registed     |
    |prueba      |pruebau5       |prueba      |Student NOT Registed     |



