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

  Scenario: Show the game board
    Given The application is configured 4 x 3
    When the application is started
    Then The Game grid will be shown

  Scenario: Board can be pre-configured
    Given The application is configured 4 x 4
    And the cells are initialized as follows
      | | | | |
      |x|x|x| |
      | | | | |
      | | | | |
    When the application is started
    Then The Game grid should be this after 1 generation
      | |*| | |
      | |*| | |
      | |*| | |
      | | | | |
