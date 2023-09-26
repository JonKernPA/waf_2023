Feature: Users can start the game of life simulation

  Scenario: Start the game
    Given The application is configured
    When The Start button is pressed
    Then The Game will Start

  Scenario: Stop the game
    Given The application is configured
    And the application is started
    When The Stop button is pressed
    Then The Game will be stopped
