Feature: Authenticate user.

  Scenario: User sign in to app and then sign out from app.
    Given I access to "/"
    And I click "Sign in"
    When I sign in to app
    Then I should can sign in to app
    When I sign out from app
    Then I should can sign out from app

  Scenario: User register to app.
    Given I access to "/users/sign_in"
    When I register to app
    Then I should can sign in to app

  @javascript
  Scenario: User click user name to see user's panel.
    Given I access to "/users/sign_in"
    And I sign in to app
    When I click my user name
    Then I should can see user panel

  Scenario: User edit user info.
    Given I access to "/users/sign_in"
    And I sign in to app
    When I edit new user info
    Then I should can my user current info