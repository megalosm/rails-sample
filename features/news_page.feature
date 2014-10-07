Feature: Access to news page.

  Scenario: Access to main page.
    Given I am not sign in to app
    When I access to "/"
    Then I should can see "Moving Limes"

  @javascript
  Scenario: Access to news detail page.
    Given Web have 5 news
    And I access to "/"
    When I click news content
    Then I should can see news detail

  Scenario: Access to news detail page from top news link.
    Given Web have 5 news
    And I access to "/"
    When I click top news link
    Then I should can see news detail