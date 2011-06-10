Feature: Creating a User Token
  So that I can authenticate with the API
  As a client
  I want to be able to obtain a User Token

  @wip
  Scenario: Generating And Sending The Token
    Given a user exists
    When I make a valid API request for a user token
    Then I should receive a valid token in the response
