Feature: Vote with SMS
  In order to vote for one competitor
  Voter
  wants to send an SMS

  Scenario: Voter votes for one competitor
    Given there is a running competition with 3 registrations

    When the Voter sends SMS with content "2"

    Then SMS is accepted
    And competitor number 1 should have 0 votes
    And competitor number 2 should have 1 vote
    And competitor number 3 should have 0 votes


  Scenario: Three voters vote
    Given there is a running competition with 3 registrations

    When the Voter "Mati" sends SMS with content "2"
    And the Voter "Kati" sends SMS with content "1"
    And the Voter "Pille" sends SMS with content "1"

    Then SMS is accepted
    And competitor number 1 should have 2 votes
    And competitor number 2 should have 1 vote
    And competitor number 3 should have 0 votes


  Scenario: Voter changes his vote
    Given there is a running competition with 3 registrations
    And the Voter "Mati" sends SMS with content "2"
    When the Voter "Mati" sends SMS with content "1"

    Then SMS is accepted
    And competitor number 1 should have 1 votes
    And competitor number 2 should have 0 vote
    And competitor number 3 should have 0 votes


  Scenario: Voter votes for nonexistent competitor
    Given there is a competition with 3 registrations
    When the Voter sends SMS with content "4"
    Then SMS is rejected


  Scenario: Voter sends garbage
    Given there is a competition with 3 registrations
    When the Voter sends SMS with content "Tere Mark!"
    Then SMS is rejected


  Scenario: Voter votes while competition is not running
    Given there is a competition with 1 registration
    When the Voter sends SMS with content "1"
    Then SMS is rejected