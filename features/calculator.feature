Feature: People needs to adds the numberz
  So they can, you know, add stuff

  Scenario Outline: Add two numbers
    Given I have a calculator
    When I add two numbers <a> and <b>
    Then I should see <x>
    Examples:
      | a  | b   | x   |
      | 1  | 1   | 2   |
      | 10 | 101 | 111 |




