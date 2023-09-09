# World Agility Forum 2023

Workshop for Experiencing Agile

## My Environment

I run my code on a MacBook Pro, 32 GB, Apple M2 Max CPU

I use RVM (see `.ruby-version` and `.ruby-gemset`) to compartmentalize the ruby and gems for this specific app.

Use `$ bundle install` to get the rspec and cucumber gems installed

I use Rubymine as an IDE.

I also run rspec and cucumber from the commandline (Terminal).

In Terminal, I decorate the command line prompt (RVM gemset | working dir | branch)

    ruby-2.6.0@waf ~/railsprojects/rails4/waf on [master*]

## RSpec

You should be able to run RSpec from the command line (or your IDE) and have the initial sample test pass.

```
ruby-2.6.0@waf ~/rubyprojects/waf on [master*]
$ rspec

Calculator
  #add
    returns the sum of its arguments

Finished in 0.00134 seconds (files took 0.07109 seconds to load)
1 example, 0 failures

```

## Cucumber 
And you should be able to run Cucumber

```
ruby-2.6.0@waf ~/rubyprojects/waf on [master*]
$ cucumber
Using the default profile...
Feature: People needs to adds the numberz
  So they can, you know, add stuff

  Scenario Outline: Add two numbers    # features/calculator.feature:4
    Given I have a calculator          # features/calculator.feature:5
    When I add two numbers <a> and <b> # features/calculator.feature:6
    Then I should see <x>              # features/calculator.feature:7

    Examples: 
      | a  | b   | x   |
      | 1  | 1   | 2   |
      | 10 | 101 | 111 |

2 scenarios (2 passed)
6 steps (6 passed)
0m0.014s
```
