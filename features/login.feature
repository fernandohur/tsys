Feature: Testing LDAP
  In order to test the authentication,
  As a professor or student
  I want to authenticate using LDAP

    Scenario Outline: Many users
      Given I am in the loginPage
      When I enter the field_username with <userName>
      And I enter the field_password with <password>
      And I click on Login
      Then I should see text equal to <result>

  Examples:
    |userName    |password       |result                                       |
    |prueba      |prueba         |Aqui puedes ver el estudiante registrado     |
    |adriana     |adriana        |Aqui puedes ver el estudiante registrado     |
    |majo        |majo           |Aqui puedes ver el estudiante registrado     |
    |majo        |xx             |Wrong username/password                      |
    |absak       |majo           |Wrong username/password                      |