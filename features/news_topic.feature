Feature: News topic page actions.

  @javascript
  Scenario: User create news's comment.
    Given I access to "/users/sign_in"
    And I sign in to app
    And Web have 1 news
    And I access to news detail page
    When I comment to news context
    Then I should can see my comment in news detail page

  @javascript
  Scenario: User like new topic.
    Given I access to "/users/sign_in"
    And I sign in to app
    And Web have 1 news
    And I access to news detail page
    When I click like button
    Then I should see like icon is active and count up

  Scenario: User click comment button to see news comments.
    Given I access to "/users/sign_in"
    And I sign in to app
    And Web have 1 news
    And First news have 3 comments
    And I access to news detail page
    When I click comment button
    Then I should can see news topic comments