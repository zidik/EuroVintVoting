Feature: Vote with SMS
  As a Manager
  I want to control when it is possible to vote
  In order to successfully execute a fair voting

  Background:
    Given there is a competition with 1 registration
    And I am logged in as a Manager

  Scenario: The voting has not yet started
    When the Voter sends SMS with content "1"
    Then SMS is rejected
    And competitor number 1 should have 0 votes

  Scenario: Manager has started a competition
    When the Manager starts the voting
    And the Voter sends SMS with content "1"
    Then SMS is accepted
    And competitor number 1 should have 1 votes

  Scenario: Manager stops a started competition
    Given the Manager starts the voting
    When the Manager stops the voting
    And the Voter sends SMS with content "1"
    Then SMS is rejected
    And competitor number 1 should have 0 votes